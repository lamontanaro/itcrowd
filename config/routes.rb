Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :people do
        resources :people_movies
      end
      resources :movies
    end
  end
end
