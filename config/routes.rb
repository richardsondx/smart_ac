Rails.application.routes.draw do
  apipie
  resources :admins, only: [:index]
  resources :devices, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :devices, only: [:index, :show] do
        post 'record', on: :member
      end
    end
  end

  root 'admins#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
