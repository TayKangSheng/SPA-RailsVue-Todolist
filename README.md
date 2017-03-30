# Single Page Rails Vue Application

> This is a simple Todo List Single Page Application built with Vue & Webpack on the front-end & Rails as Server and API.

## Prerequisites
* [Ruby on Rails](http://guides.rubyonrails.org/getting_started.html)
* [Yarn Package Manager](https://yarnpkg.com/lang/en/docs/install/)

## Built with
* Rails
* Vue
* Rails Webpacker
* Page.js

## Setting up

```bash
# Install Gem dependencies
bundle install

# Create database
rails db:create

# Create Schemas
rails db:migrate

# Seed default data
rails db:seed
```

## How to build and Deploy in Development ENV

How to serve the Rails Application
``` ruby
Rails s
```

Webpack all Vue files
``` bash
rails assets:precompile
```

Find Vue files for webpacking in `app/javascript`.  

## how to build and Deploy in Production ENV

Find out more about how to deploy for production, specifications of Rails Webpacker [here](https://github.com/rails/webpacker).
