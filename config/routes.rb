Rails.application.routes.draw do
  #resources :teams
  #resources :countries
  namespace :api, defaults: {format: :json} do
  	namespace :registrations do
  		post 'sign_up'
	    get 'reset_password'
			get 'change_password'
			get 'update'
  	end
  	scope "(:auth_token)" do
	  	namespace :users do
	  		get "index"
	  		post "add_member"
	  		post "save_token"
	  	end
	  	namespace :requests do
	  		get "index"
	  		post "create"
	  		put "update/:id", action: :update
	  	end
	  end

  	namespace :auth do
  		post 'log_in'
			get 'log_out'
  	end
    
		
  end

  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "application#home"
end
