Rails.application.routes.draw do

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

end
