# Cross-posts entries to Medium.
#
# Vendored from the jekyll-crosspost-to-medium gem (0.1.16, MIT, by Aaron
# Gustafson / Jeremy Keith: https://github.com/aarongustafson/jekyll-crosspost-to-medium),
# which has been unmaintained since 2021 and is incompatible with Ruby 3.2+
# (File.exists? was removed). Vendored here instead of forking so there is
# no external gem/repo to keep in sync.
#
# Requires MEDIUM_USER_ID and MEDIUM_INTEGRATION_TOKEN environment variables.
# Only picks up posts with `crosspost_to_medium: true` in their front matter.
# Controlled globally via `enabled: true/false` under the
# `jekyll-crosspost_to_medium` key in _config.yml.

require 'json'
require 'net/http'
require 'net/https'
require 'uri'
require 'date'

module Jekyll
  class MediumCrossPostGenerator < Generator
    safe true
    priority :low

    def generate(site)
      @site = site

      @settings = @site.config['jekyll-crosspost_to_medium'] || {}
      globally_enabled = if @settings.has_key? 'enabled' then @settings['enabled'] else true end
      cache_dir = @settings['cache'] || @site.config['source'] + '/.jekyll-crosspost_to_medium'
      backdate = if @settings.has_key? 'backdate' then @settings['backdate'] else true end
      @crossposted_file = File.join(cache_dir, "medium_crossposted.yml")

      return unless globally_enabled

      user_id = ENV['MEDIUM_USER_ID'] or false
      token = ENV['MEDIUM_INTEGRATION_TOKEN'] or false

      if !user_id or !token
        raise ArgumentError, "MediumCrossPostGenerator: Environment variables not found"
      end

      FileUtils.mkdir_p(cache_dir)

      if File.exist?(@crossposted_file)
        crossposted = open(@crossposted_file) { |f| YAML.load(f) }
        # convert from an array to a hash (upgrading older versions of this plugin)
        if crossposted.kind_of?(Array)
          new_crossposted = {}
          crossposted.each do |url|
            new_crossposted[url] = 'unknown'
          end
          crossposted = new_crossposted
        end
      else
        crossposted = {}
      end

      Jekyll::Hooks.register :posts, :post_render do |post|
        next unless post.published?

        crosspost = post.data.include? 'crosspost_to_medium'
        next if !crosspost or !post.data['crosspost_to_medium']

        content = post.content
        url = "#{@site.config['url']}#{post.url}"
        title = post.data['title']

        published_at = backdate ? post.date : DateTime.now

        crosspost_payload(crossposted, post, content, title, url, published_at)
      end
    end

    def crosspost_payload(crossposted, post, content, title, url, published_at)
      # Update any absolute URLs, but don't clobber protocol-less ("//") URLs
      content = content.gsub /href=(["'])\/(?!\/)/, "href=\\1#{@site.config['url']}/"
      content = content.gsub /src=(["'])\/(?!\/)/, "src=\\1#{@site.config['url']}/"

      canonical_url = url

      content.prepend("<h1>#{title}</h1>")
      if @settings['text']
        canonical_text = "#{@settings['text']}"
        canonical_text = canonical_text.gsub /{{ url }}/, canonical_url
      else
        canonical_text = "<p><i>This article was originally posted <a href=\"#{url}\" rel=\"canonical\">on my own site</a>.</i></p>"
      end
      content << canonical_text

      url = url.sub(/^#{@site.config['url']}?/, '')

      tags = post.data['tags']
      tags = tags.split(',') if tags.kind_of? String

      return unless url and !crossposted.has_key?(url)

      payload = {
        'title'         => title,
        'contentFormat' => "html",
        'content'       => content,
        'tags'          => tags,
        'publishStatus' => @settings['status'] || "public",
        'publishedAt'   => published_at.iso8601,
        'license'       => @settings['license'] || "all-rights-reserved",
        'canonicalUrl'  => canonical_url
      }

      if medium_url = crosspost_to_medium(payload)
        crossposted[url] = medium_url
        File.open(@crossposted_file, 'w') { |f| YAML.dump(crossposted, f) }
      end
    end

    def crosspost_to_medium(payload)
      user_id = ENV['MEDIUM_USER_ID']
      token = ENV['MEDIUM_INTEGRATION_TOKEN']
      medium_api = URI.parse("https://api.medium.com/v1/users/#{user_id}/posts")

      https = Net::HTTP.new(medium_api.host, medium_api.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(medium_api.path)

      request['Authorization'] = "Bearer #{token}"
      request['Content-Type'] = "application/json"
      request['Accept'] = "application/json"
      request['Accept-Charset'] = "utf-8"

      request.body = JSON.generate(payload)

      response = https.request(request)

      if response.code == '201'
        medium_response = JSON.parse(response.body)
        puts "Posted '#{payload['title']}' to Medium as #{payload['publishStatus']} (#{medium_response['data']['url']})"
        medium_response['data']['url']
      else
        puts "Attempted to post '#{payload['title']}' to Medium. They responded #{response.body}"
        false
      end
    end
  end
end
