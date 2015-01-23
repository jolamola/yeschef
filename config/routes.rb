Rails.application.routes.draw do

root to: 'users#new'

resources :users

resources :recipes do
	resources :components 


	end
end
