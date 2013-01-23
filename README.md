# ActiveApplication

NOTICE: EXPERIMENTAL ALPHA VERSION, DO NOT USE IN PRODUCTION

[![Build Status](https://secure.travis-ci.org/jarijokinen/active_application.png)](http://travis-ci.org/jarijokinen/active_application) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/jarijokinen/active_application)

## Features

* Authentication by Devise
* Authorization by CanCan
* Role management by rolify
* Formtastic as a form builder
* Twitter Bootstrap as a CSS framework
* Resource handling by SimpleResource
* Pagination by Kaminari

## Requirements

* Ruby 1.9 or greater
* Rails 3.2 or greater

## Installation

Add this line to your application's Gemfile:

    gem "active_application"

And then execute:

    $ bundle

Run generator:

    $ rails g active_application:install

## Usage

### Roles

    :customer           Ability to manage own resources
    :administrator      Ability to manage everything
    (no role)           Ability to view all resources by default (index, show)

### Namespaces

    :customer           Requires authentication and :customer role
    :backend            Requires authentication and :administrator role
    (no namespace)      Requires nothing

Route namespaces

    /customer/blogs     customer/blogs#index      customer_blogs_path
    /customer/posts     customer/posts#index      customer_posts_path
    
    /backend/blogs      backend/blogs#index       backend_blogs_path
    /backend/posts      backend/posts#index       backend_posts_path
    
    /blogs              blogs#index               blogs_path
    /posts              posts#index               posts_path

Controller namespaces

    # app/controllers/customer/
    Customer::BlogsController < ActiveApplication::Customer::UserResourceController
    Customer::PostsController < ActiveApplication::Customer::ResourceController

    # app/controllers/backend/
    Backend::BlogsController < ActiveApplication::Backend::ResourceController
    Backend::PostsController < ActiveApplication::Backend::ResourceController

    # app/controllers/
    BlogsController < ActiveApplication::Public::ResourceController
    PostsController < ActiveApplication::Public::ResourceController

### Layouts

ActiveApplication::Customer* controllers:

    layout "active_application/customer"

ActiveApplication::Backend* controllers:

    layout "active_application/backend"

Other controllers:

    layout "application"

## Support

If you have any questions or issues with ActiveApplication, or if you like to report a bug, please create an [issue on GitHub](https://github.com/jarijokinen/active_application/issues).

## License

MIT License. Copyright (c) 2012 - 2013 [Jari Jokinen](http://jarijokinen.com). See [LICENSE](https://github.com/jarijokinen/active_application/blob/master/LICENSE.txt) for further details.
