Rails.application.routes.draw do
  
  resources :boards

  resource :users, conttoller: 'registrations', only: [:create, :edit, :update] do
     get '/sign_up', action: 'new'
  end

  resource :users ,controller: 'sessions', only: [] do
    get '/sign_in', action: 'new'
    post '/sign_in', action: 'create'
    delete '/sign_out', action: 'destroy'
  end

  root 'boards#index'
  # 首頁轉去boards首頁
  # root 'boards#index'
end
