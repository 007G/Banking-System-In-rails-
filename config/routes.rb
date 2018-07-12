Rails.application.routes.draw do
  get 'benificiaries/index'
  get 'benificiaries/show'
  devise_for :users, controllers: { confirmations: 'confirmations' }
 
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  
  resources :welcome 
   
  resources :benificiaries

  resources :transactions

  resources :users do
    get 'verify', on: :member
  end 
end
