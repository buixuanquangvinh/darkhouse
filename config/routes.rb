Rails.application.routes.draw do
  devise_for :users
  root 'application#home'
  get '/lien-he', to: 'application#contact'
  get '/ve-cong-ty', to: 'application#about'
  get '/du-an-tieu-bieu', to:'application#highlight'
  get '/catalog/:slug', to:'application#catalog'
  get '/project/:slug', to:'application#project'
  post '/upload-image', to:'application#upload_image'

  namespace :admin do
    root to: "dashboard#index"
    resources :categories, :news, :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
