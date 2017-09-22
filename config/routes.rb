Rails.application.routes.draw do
  default_url_options host: "localhost:3000"
  devise_for :users
  HighVoltage.configure do |config|
    config.route_drawer = HighVoltage::RouteDrawers::Root
  end

  HighVoltage.configure do |config|
    config.home_page = 'index'  
  end
  
  resources :users do
    collection do
      post 'registration'
    end
    
    collection do
      post 'login'
    end
    
    member do
      get 'logout'
    end
  end
end
