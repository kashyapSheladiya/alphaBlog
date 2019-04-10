Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles #resources will give a path for new_article, edit_article, show_article, update_article, index_article, destroy_article.
                      #To view all the paths or routes in console it can be typed "rake routes"

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  
end
