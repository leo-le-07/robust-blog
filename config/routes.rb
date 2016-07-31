Rails.application.routes.draw do
  root 'home#index'

  resources :users do
  	resources :blogs do
  	end
  end

  resources :blogs do
    resources :comments do
    end
  end
end
