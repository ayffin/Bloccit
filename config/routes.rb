Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
  end
  resources :users, only: [:new, :create]

  root "welcome#index"
  get "about" => 'welcome#about'
  post "users/confirm" => "users#confirm"




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
