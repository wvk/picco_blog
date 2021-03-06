![PiccoBlog Logo](https://acentrosys.com/img/piccoblog-b.png)

[![Gem Version](https://badge.fury.io/rb/picco_blog.svg)](https://badge.fury.io/rb/picco_blog)

PiccoBlog is a simple and light weight markdown blog engine for Ruby on Rails (v4.2.4+) applications.

#### Basic functionality includes:

- Title, body, exceprt
- Featured image
- Tagging
- Pagination
- Member's only flag
- Hidden/Visible state
- Simple comments

#### TODO:
- Enable autosave feature
- Integrate complete test suite

#### Dependencies:
- [SimpleMDE v1.11.2 Markdown Editor Library](https://simplemde.com) (included)
- JQuery (not included)

## Installation

Add this line to your application's Gemfile:
```Ruby
gem 'picco_blog'
```

And then execute:
```
$ bundle install
```

Generate the install files (migrations and initializer)
```
$ rails generate picco_blog:install
```

Run migrations
```
$ rake db:migrate
```

If you want to override the default ERB views (most likely you do)
```
$ rails generate picco_blog:views
```

Add to `config/routes.rb`
```
mount PiccoBlog::Engine => "/blog"
```

Include the PiccoBlog Javascript and CSS Assets. Note: JQuery is required to be loaded first!

Add to `assets/javascripts/application.js`
```
//= require picco_blog/application
```

Add to `assets/stylesheets/application.css`
```
 *= require picco_blog/application
```

Done!

## Configuation

#### Initializer
The default initializer was copied to `config/initializers/picco_blog.rb`. Each configurable option is commented in the file.

#### Dependency gems
By default, Dragonfly and Friendly ID gems are utilized. To override these configurations, create `config/initializers/dragonfly.rb` and `config/initializers/friendly_id.rb` initializers.

## Issues
Please use the [issue tracker](https://github.com/acentro/picco_blog/issues) if you have any issues.

## Change Log
Changes are listed in [CHANGELOG.md](https://github.com/acentro/picco_blog/blob/master/CHANGELOG.md)

## Credits & Copyright
[Brandon Bango](https://github.com/brandonbango) - Author

This project rocks and uses MIT-LICENSE.
