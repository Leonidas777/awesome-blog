Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :create] do
        resources :rates, only: [:create]
      end

      resources :user_ip_addresses, only: [:index]
    end
  end

end
