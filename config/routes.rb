Rails.application.routes.draw do
  resources :boards

  
  # sessions發cookie認證
  # delete '/users/sigh_out', to: 'sessions#destroy'
  get '/users/sign_up', to: 'registrations#new', as: 'registration'
  post '/users', to: 'registrations#create'
  get '/users/sign_in', to: 'sessions#new', as: 'session'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/users/sign_out', to: 'sessions#destroy', as: 'logout'

  root 'boards#index'
  # 首頁轉去boards首頁
  # root 'boards#index'
end
