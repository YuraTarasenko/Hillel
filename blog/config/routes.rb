Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
  devise_for :users

  post '/comments' => 'comments#create', as: 'comments'

  mount Ping::Engine, at: '/ping'
end
