Rails.application.routes.draw do

  resources :csvuploads do 
    collection { post :import }
  end
  resources :movieuploads
  resources :ratings do
    
    resources :characters
    
    
 
  end
  
  resources :soheis
  
  resources :users
  resources :viewers
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'about' => 'sites#about'
  get 'register' => 'viewers#new'
  get 'login' => 'sessions#new'
  get 'logout' =>'sessions#destroy'
  get 'auth/:provider/callback' => "authentifications#create"
  root 'sites#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
