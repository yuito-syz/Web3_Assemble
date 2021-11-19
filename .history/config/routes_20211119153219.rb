Rails.application.routes.draw do
  resources :post
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'comments/:id/destroy' => 'comments#destroy'
  post 'comments/:id/create' => 'comments#create'
  
  resources :users do
    member do
      get :following, :followers
    end
    resources :microposts, only: %i[index show create] do
      resources :comments, only: [:create]
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end