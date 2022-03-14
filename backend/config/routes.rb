Rails.application.routes.draw do
  devise_for :users
  
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'auth/registrations'
      }
  
      resource :relationships, only: [:create, :destroy] do
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
      end
      
      resources :guests, only: [:create]
      resources :projects, only: [:index]
      resources :posts
      resources :likes, only: [:index, :create, :destroy]
      get 'search' => "searches#search"
    end
  end
end