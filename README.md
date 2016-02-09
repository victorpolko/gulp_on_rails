#Gulp on Rails Template

***
A simple template for a RoR project with gulp used as assets pipeline.

***

##Configured
1. Rails 4.2.4
1. Ruby 2.2.3
1. PostgreSQL as database
1. Ruby Slim for HTML-templating
1. Simple Form
1. Capistrano 3.4.0
1. Bower
1. Whenever
1. Sidekiq
1. RSpec
1. Foreman

## ToDo after cloning
1. Change project name (search for ``gulp_on_rails`` and ``GulpOnRails``)
1. Set ``REPO_URL`` in *config/deploy.rb*
1. Set ``STAGING_SERVER_IP`` and ``PRODUCTION_SERVER_IP`` in <i>config/deploy/\*.rb</i>
1. Clone *config/database.yml.example* and *config/secrets.yml.example* to *config/database.yml* and *config/secrets_dev.yml* respectively and update their contents (I use ``Heroku`` for production server, so I need *secrets.yml* to contain .env-based secrets. *config/environments/development.rb* states that it will use *secrets_dev.yml* file in development mode)
1. Bundle everything up with ``bin/build``
1. Run ``bundle exec foreman start``. It will start Thin on port 3000, fire Gulp default task and daemonize sidekiq. All these are in *Procfile*
