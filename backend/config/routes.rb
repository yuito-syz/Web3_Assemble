Rails.application.routes.draw do
  devise_scope :users do
    post "api/v1/auth/guest_sign_in", to: "api/v1/auth/sessions#guest_sign_in"
  end
  
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: "api/v1/auth/sessions",
        confirmations: "api/v1/auth/confirmations",
        passwords: "api/v1/auth/passwords"
      }

      resources :users do
        member do
         get :following, :followers
        end
      end
  
      resources :relationships, only: [:create, :destroy]
      resources :projects, only: [:index]
      resources :posts
      resources :likes, only: [:index, :create, :destroy]
      get 'search' => "searches#search"
    end
  end
end