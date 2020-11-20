Rails.application.routes.draw do
  resources :boards

  get '/users/sign_in', to: 'sessions#new'
  # sessions發cookie認證
  delete '/users/sigh_out', to: 'sessions#destroy'
  get '/users/sign_up', to: 'registrations#new'
  post '/users/sign_up', to: 'registrasions#create'
  get '/users', to: 'users#index'


  get '/', to: 'boards#index' 
  # 首頁轉去boards首頁
  # root 'boards#index'
end
