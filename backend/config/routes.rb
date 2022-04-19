Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_scope :api_v1_user do
        post "users/guest_sign_in", to: "users/auth/sessions#guest_sign_in"
      end

      mount_devise_token_auth_for 'User', at: 'user/auth', controllers: {
        registrations: 'api/v1/users/auth/registrations',
        sessions: "api/v1/users/auth/sessions",
        confirmations: "api/v1/users/auth/confirmations",
        passwords: "api/v1/users/auth/passwords"
      }

      resources :users do
        member do
         get :following, :followers
        end
      end
  
      resources :relationships, only: [:create, :destroy]
      resources :projects, only: [:index]
      resources :posts do
        resources :comments, only:[:create, :destroy]
        resources :likes, only: [:index, :create, :destroy]
        collection do
          get 'confirm'
        end
      end
      get 'search', to: "searches#search"
      resources :headlines
    end
  end
end