Rails.application.routes.draw do

root to: 'users#index'

get '/signup' => 'users#new', as: :signup
post '/signup' => 'users#create'

get '/login' => 'sessions#new', as: :login
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy', as: :logout



resources :users 
resources :recipes do
	resources :components 


	end
end
