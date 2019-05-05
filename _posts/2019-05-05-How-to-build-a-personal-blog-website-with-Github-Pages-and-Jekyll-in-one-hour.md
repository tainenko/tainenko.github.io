---
layout: post
title:  "How to build a personal blog website with Github Pages and Jekyll in one hour"
author: tony
categories: [ Jekyll, tutorial ]
image: assets/images/jekyll_github.png
tags: [jekyll, tutorial,featured, blog, github pages]
---
# Step 1: [Github Pages](https://pages.github.com/)

# Step 2: [Jekyll](https://jekyllrb.com/)
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

