MiniApp::Application.routes.draw do


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  
  resources :users do
    resources :requests do
      get "request_info" , :on => :collection
    end

  end
  
end