Rails.application.routes.draw do
  resources :topics
  devise_for :users, controller: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#home'
  
end
