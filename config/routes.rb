Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'pages#type'
  get 'logsin', to: 'pages#type1'
  get 'signup1', to: 'companies#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :companies, except: [:new]
  get 'signup2', to: 'applicants#new'
  get 'login2', to: 'sessions#new1'
  post 'login2', to: 'sessions#create1'
  delete 'logout2', to: 'sessions#destroy1'
  resources :applicants, except: [:new]
  resources :posts
end
