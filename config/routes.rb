Rails.application.routes.draw do
  resources :valet_data do
	  collection do
	    post :import
	  end
	end

	#root '/valet_data/'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
