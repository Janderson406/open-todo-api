Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists, except: [:new, :edit]
    end

    resources :lists, only: [] do
      resources :items, only: [:create, :update]
    end

    resources :items, only: [:destroy]
  end
end
# namespace separates the API routes from the rest of the application routes.
# defaults: { format: :json} tells the route to support requests in JSON form
