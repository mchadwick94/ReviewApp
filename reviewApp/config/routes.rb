Rails.application.routes.draw do

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
  resources :reviews
  resources :profiles
  resources :users
  resources :sessions

end
