Rails.application.routes.draw do
  root 'welcome#index'

  if Rails.env.development? || Rails.env.staging?
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
  end
end
