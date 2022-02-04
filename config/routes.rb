Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    sessions: 'devise_token_auth/sessions'
  }
  scope format: 'json' do
    namespace :users do 
      resource :account, only: :show
    end

    resources :posts

    resources :users do
      resources :posts
      resource :two_factor_auth, only: [:show, :create]
    end
  end
end