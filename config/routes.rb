Rails.application.routes.draw do
  get 'signin' => 'sessions#new'
  get 'signout' => 'sessions#destroy'
  get 'signup' => 'users#new'

  root 'blogs#index'

  resources :users do
  	resources :blogs do
  	end
  end

  resources :blogs do
    resources :comments do
    end
  end

  resources :sessions

  resources :my_blogs, only: [:index]
end
