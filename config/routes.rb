Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'pages#type'
  get 'signup1', to: 'companies#new'
  resources :companies, except: [:new]
end
