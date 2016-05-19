Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users
  end
end

# namespace separates the API routes from the rest of the application routes.
# defaults: { format: :json} tells the route to support requests in JSON form
