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
  
      resource :relationships, only: [:create, :destroy] do
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
      end
      
      resources :projects, only: [:index]
      resources :posts
      resources :likes, only: [:index, :create, :destroy]
      get 'search' => "searches#search"
    end
  end
end