Rails.application.routes.draw do
  get '/users/:id', to: 'users#show', as: 'user'

  get '/signup', to: 'users#new'

  get '/', to: 'pages#home'

  get 'pages/contact'

  get 'pages/about'

  get 'pages/help'

get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
