Rails.application.routes.draw do

  resources :ratings do
    resources :characters
  end
  
  resources :users
  resources :viewers
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'about' => 'sites#about'
  get 'register' => 'viewers#new'
  get 'login' => 'sessions#new'
  get 'logout' =>'sessions#destroy'

  root 'sites#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
