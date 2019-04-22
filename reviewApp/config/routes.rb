Rails.application.routes.draw do

  get 'sessions/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'static_pages/home'
  root 'static_pages#home'
  get 'static_pages/about'
<<<<<<< HEAD
    root 'static_pages#about'
  get 'static_pages/contact'
    root 'static_pages#contact'
=======
  get 'static_pages/contact'
>>>>>>> 1df1b77f552631e86b777a9ff485570439e551fc
  resources :products, :shallow => true do
      resources :reviews
      
      collection do
  	   get :search
    end
    end
  resources :profiles
  resources :users, only: [:new, :create, :edit, :update]
  resources :sessions
  resources :password_resets
  resources :contacts


end
