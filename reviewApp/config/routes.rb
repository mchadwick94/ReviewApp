Rails.application.routes.draw do

  resources :reviews
  get 'sessions/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'static_pages/home'
  root 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/contact'
  resources :products do
  collection do
  	get :search
  end
end
  resources :profiles
  resources :users
  resources :sessions

end
