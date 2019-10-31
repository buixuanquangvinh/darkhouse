Rails.application.routes.draw do
  devise_for :users
  root 'application#home'
  get '/home', to: 'application#home'
  get '/catalog/:slug', to:'application#catalog'
  get '/project/:slug', to:'application#project'

  namespace :admin do
    root to: "dashboard#index"
    resources :categories, :news
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
