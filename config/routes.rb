Rails.application.routes.draw do
	root "categories#index"

  resources :categories do
  	resources :comments
  	resources :posts do
  		resources :comments
  	end
  end
end
