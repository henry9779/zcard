Rails.application.routes.draw do
  resources :boards


  get '/', to: 'boards#index' #首頁轉去boards首頁
  #root 'boards#index'
end
