---
layout: post
title:  "How to crosspost article from jekyll to medium"
author: tony
categories: [ jekyll ]
image: assets/images/jykell_crosspost_to_medium.png
tags: [ jekyll , medium]
comments: true
crosspost_to_medium: true
---
It's a pure record about how to crosspost from jekyll to medium with jekyll-crosspost-to-medium plugin.  

# Setup
## Set Environment Variable of MEDIUM_INTEGRATION_TOKEN & MEDIUM_USER_ID
1. [Sign up for a Medium account](https://medium.com/m/signin?redirect=https%3A%2F%2Fmedium.com%3A443%2F) (if you don’t already have one). Log in.
2. [Request an integration token](https://help.medium.com/hc/en-us/articles/213480228-Get-an-integration-token-for-your-writing-app) by emailing [yourfriends@medium.com](mailto:yourfriends@medium.com). Medium will then grant you access to a clientId and a clientSecret on your settings page. [Read their API docs for more information](https://github.com/Medium/medium-api-docs#21-browser-based-authentication).  
3. Go to [your settings page](https://medium.com/me/settings) and look for "Integration Tokens". Generate one and save it to your Environment Variables as MEDIUM_INTEGRATION_TOKEN.
![MEDIUM_INTEGRATION_TOKEN](/assets/images/MEDIUM_INTEGRATION_TOKEN.png)
4. Visit https://api.medium.com/v1/me?accessToken=, adding your Integration Token to the end of that URL
5. Grab the id from the JSON provided and save that to your Environment Variables as MEDIUM_USER_ID.
![MEDIUM_USER_ID](/assets/images/MEDIUM_USER_ID.png)

# Installation of crosspost plugin
This plugin can be installed in two ways:

1. As a Ruby Gem: gem install jekyll-crosspost-to-medium
    - Via _config.yml add jekyll-crosspost-to-medium to your gems list; or
        ```yaml
        #_config.yml
        # Plugins
        plugins:
          - jekyll-feed
          - jekyll-sitemap
          - jekyll-paginate
          - jekyll-seo-tag
          - jekyll-crosspost-to-medium
        ```
    - Add require 'jekyll-crosspost-to-medium' to ext.rb in your plugins directory (new or existing one)
        ```
      #Gemfile
        gem 'wdm', '>= 0.1.0' if Gem.win_platform?
        group :jekyll_plugins do
            gem 'jekyll-feed'
            gem 'jekyll-sitemap'
            gem 'jekyll-paginate'
            gem 'jekyll-seo-tag'
            //add the plugin here
            gem 'jekyll-crosspost-to-medium' 
        end
        ```
2. By directly copying jekyll-crosspost-to-medium.rb (found in the lib directory) into your plugins directory.

# Crossposting tag
Add ```crosspost_to_medium: true``` to the front matter of any post you would like to crosspost to Medium.

For example:  
```
---
layout: post
title:  "How to crosspost article from jekyll to medium"
author: tony
categories: [ jekyll ]
image: assets/images/jykell_crosspost_to_medium.png
tags: [ jekyll ]
comments: true
crosspost_to_medium: true
---
```

# More Configuation
This plugin takes a number of configuration options. These allow you to customise how the plugin works and what metadata is included when you syndicate to Medium. The following options are available:

```yaml
jekyll-crosspost_to_medium:
  enabled: true | false
  cache: .jekyll-crosspost_to_medium
  status: public (default) | draft | unlisted
  license: all-rights-reserved (default) | cc-40-by | cc-40-by-sa | cc-40-by-nd | cc-40-by-nc | cc-40-by-nc-nd | cc-40-by-nc-sa | cc-40-zero | public-domain
  text: '<p><i>Your (optional) signoff for the post.</i></p>'
  backdate: true (default) | false
```

* `enabled`

    Default: `true`

    Controls crossposting globally. Setting this to false will skip the processing loop entirely which can be useful for local preview builds.

* `cache`

    Default: `[source directory]/.jekyll-crosspost_to_medium`

    The name of the diretory where crossposted files will be logged. Make sure this file gets checked into your Git repo if you work from multiple computers. This will ensure you never crosspost an entry more than once.

* `status`

    Default: `public`

    The status your post is given when it is syndicated to Medium.

* `license`

    Default: `all-rights-reserved`

    The license your post is given when it is syndicated to Medium.

* `text`

    Default: `<p><i>This article was originally posted <a href="{{ url }}" rel="canonical">on my own site</a>.</i></p>`

    Optionally, provide a string to override the default text for the canonical link back to the source post. A `{{ url }}` placeholder should be provided to indicate where to put the canonical link, e.g., `Some <a href="{{ url }}">link</a>`

* `backdate`

    Default: `true`

    Whether or not to use the original date & time of publication when crossposting.
    
# Ref.
1. [Migrating from Jekyll to Medium](https://mythoughts.io/migrating-from-jekyll-to-medium-98f83bad1619)
2. [Crosspost to Medium Generator for Jekyll and Octopress](https://github.com/aarongustafson/jekyll-crosspost-to-medium)
3. [「教學」使用官方外掛將 WordPress 文章同步到 Medium 部落格](https://diary.taskinghouse.com/posts/%E3%80%8C%E6%95%99%E5%AD%B8%E3%80%8D%E4%BD%BF%E7%94%A8%E5%AE%98%E6%96%B9%E5%A4%96%E6%8E%9B%E5%B0%87-wordpress-%E6%96%87%E7%AB%A0%E5%90%8C%E6%AD%A5%E5%88%B0-medium-%E9%83%A8%E8%90%BD%E6%A0%BC/)
