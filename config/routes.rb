Rails.application.routes.draw do
  get 'sites/index'

  get 'sites/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  default_url_options host: "localhost:3000"
  devise_for :users
  HighVoltage.configure do |config|
    config.route_drawer = HighVoltage::RouteDrawers::Root
  end

  HighVoltage.configure do |config|
    config.home_page = 'index'  
  end
  
  resources :sites do
    member do
      get 'rating'
    end
  end
end
