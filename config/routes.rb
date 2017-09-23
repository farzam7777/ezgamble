Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  default_url_options host: "https://ezgamble.herokuapp.com/"
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
  
  resources :reviews
end
