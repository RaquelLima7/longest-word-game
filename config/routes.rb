Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/new', to: 'pages#new', as: 'new'
  post '/score', to: 'pages#score', as: 'score'
end
