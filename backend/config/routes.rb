Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only:[] do
          get :current_user, action: :show, on: :collection
      end

      resources :user_token, only: [:create] do
          delete :destroy, on: :collection
      end

      resource :relationships, only: [:create, :destroy] do
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
      end
      
      resources :guests, only: [:create]
      resources :projects, only: [:index]
      resources :posts
      resources :likes, only: [:index, :create, :destroy]
    end
  end
end