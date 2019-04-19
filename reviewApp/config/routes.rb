Rails.application.routes.draw do

  get 'sessions/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'static_pages/home'
  root 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/contact'
  resources :products, :shallow => true do
      resources :reviews
      
      collection do
  	   get :search
    end
    end
  resources :profiles
  resources :users
  resources :sessions

end
