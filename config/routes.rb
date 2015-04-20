Rails.application.routes.draw do
  post '/pages/convert', to: 'pages#convert'
  root 'pages#home'
end
