Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :events do
    resources :comments
  	member do
  		put :going, to:'events#upvote'
  		put :idc, to:'events#downvote'
    end
    collection do
      get :search
  	end
  end

  root 'events#index'

  get '/topevents', to: 'pages#topevents', as: 'topevents'
  get '/randomevents', to: 'pages#randomevents', as: 'randomevents'
  get 'category/:id', to: 'categories#show', as: 'category'
  
  
end
