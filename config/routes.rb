Rails.application.routes.draw do
  devise_for :users
  resources :infos do
  	member do
  		put "like",    to: "infos#upvote"
  	end
  end

  root "infos#index"
end
