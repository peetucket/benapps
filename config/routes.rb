Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'average', to: 'average#index'
  post 'compute_average', to: 'average#compute'

  resources :messages do
    member do
      post 'check_password'
    end
  end

  # match ':controller(/:action(/:id))', via: [:get, :post] # wildcard route for any non-restful controller/action

end
