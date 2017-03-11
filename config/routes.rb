Rails.application.routes.draw do
  resources :tags, except: :show
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :posts do

  	member do
  		put "like" => "posts#upvote"
  		put "dislike" => "posts#downvote"
  	end

  	resources :steps, shallow: true do
      resources :comments
      collection { post :sort }   
  	end
  end
  
  root 'posts#index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
