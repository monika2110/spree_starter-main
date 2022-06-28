Rails.application.routes.draw do
  # Spree routes
  mount Spree::Core::Engine, at: '/'
  Spree::Core::Engine.routes.prepend do
    namespace :admin, path: Spree.admin_path do
      resources :badges
      resources :product_badges
    end
  end
  # sidekiq web UI
  require 'sidekiq/web'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == Rails.application.secrets.sidekiq_username &&
      password == Rails.application.secrets.sidekiq_password
  end
  mount Sidekiq::Web, at: '/sidekiq'
end
