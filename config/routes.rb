Rails.application.routes.draw do
  resources :searchs
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
      resources :comments, only: [:create]
    end
  end
  
  resources :account_activations, only: [:edit]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end