Rails.application.routes.draw do
  devise_for :users
  root 'application#home'
  get '/lien-he', to: 'application#contact'
  get '/ve-cong-ty', to: 'application#about'
  get '/tuyen-dung', to: 'application#recruitment'
  get '/du-an', to:'application#highlight'
  get '/catalog/:slug', to:'application#catalog'
  get '/project/:slug', to:'application#project'

  get '/tin-tuc', to:'application#darkhouse_news'
  get '/tin-tuc/:slug', to:'application#darkhouse_news_detail'

  namespace :admin do
    root to: "dashboard#index"
    post '/upload-image/:news_id', to:'photos#upload_image'
    post '/sort-image', to:'photos#sort_image'
    resources :categories, :news, :users, :abouts, :recruitments, :photos, :customer_comments, :darkhouse_news
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
