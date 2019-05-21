---
layout: post
title:  "Intro: Github pages and jekyll"
author: tony
categories: [ Jekyll, tutorial ]
image: assets/images/jekyll_github.png
tags: [jekyll, tutorial,featured, blog, github pages]
---
Jekyll is a great platform for publishing content, but it can be quite difficult to get up and running on a local environment due to its dependencies. 

# Step 1: [Github Pages](https://pages.github.com/)

# Step 2: [Jekyll](https://jekyllrb.com/)
## What is Jekyll
Jekyll is a static site generator, typically used for blogs. It processes a folder containing different items like posts, drafts, layouts and converts it into a fully fledged static html site that you can publish. The folder is typically stored in version control, and a build pipeline takes care of processing that folder and publishing a new site.

In order to process that folder, you need to have the jekyll executable and all of its dependencies.

```bash
jekyll new my-blog (to create a new folder structure)
jekyll build (to process the folder structure, and generate an html site)
jekyll serve (to run an http server on your local environment)
```
However, as stated before, in order to run the jekyll executable on your environment, you’ll need to have a lot of dependencies in place.

## Build Jekyll in container
dockerfile
```
FROM ruby:2.6
RUN gem install jekyll bundler
WORKDIR /src
ENTRYPOINT bundle update && bundle exec jekyll serve \
  --host 0.0.0.0 --config _config.yml
```
command 
```
docker build -t my-jekyll-env -f Dockerfile .
docker run --name my-jekyll-env \
  --mount type=bind,source=$(pwd)/src,target=/src \
  -p 4000:4000 \
  -it \
   my-jekyll-env
```

The --mount flag shares my local files with the container.  
The -p flag automatically forwards port 4000 outside the container to port 4000 inside the container.  
The -it flag connects my terminal to the server, so that I can use Ctrl-C to quit.  
  

# Step 3: [Jekyll Themes](http://jekyllthemes.org/)

# Step 4: Making Pages in Jekyll

# Step 5: Adding Google Analytics to your Jekyll blog

