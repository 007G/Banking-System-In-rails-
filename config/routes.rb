Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }
 
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  
  resources :welcome 
   
  

  resources :users do
    get 'verify', on: :member
  end 
end
