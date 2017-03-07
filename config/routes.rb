Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'tags/:tag', to: 'posts#index', as: :tag
  resources :posts do

  	member do
  		put "like", to: "posts#upvote"
  		put "dislike", to: "posts#downvote"
  	end

  	resources :steps do
            resources :photos
            put :sort, on: :collection
  	end

  end
  
  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
