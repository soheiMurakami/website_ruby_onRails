Rails.application.routes.draw do

  resources :ratings do
    resources :characters
  end
  
  get 'about' => 'sites#about'

  root 'sites#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
