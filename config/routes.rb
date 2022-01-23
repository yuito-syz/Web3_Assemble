Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :word_of_mouths
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  resources :likes, only: [:create, :destroy]
  resources :users do
    get :search, on: :collection
    member do
      get :following, :followers
    end
    resources :microposts, only: %i[index show create] do
    end
  end
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end