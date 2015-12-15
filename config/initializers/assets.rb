# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
if Rails.env.development?
  Rails.application.config.assets.paths << Rails.root.join('app', 'frontend')
  Rails.application.config.assets.paths << Rails.root.join('app', 'frontend', 'images')
  Rails.application.config.assets.paths << Rails.root.join('app', 'frontend', 'build')
end

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
