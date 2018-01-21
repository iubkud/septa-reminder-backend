Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :alerts
      resource :auth, only: %i[create]
    end
  end
end
