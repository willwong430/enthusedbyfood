Agreedupon1::Application.routes.draw do
  resources :users, path: 'foodies' do
    member do
      get :following, :followers, :ratings
    end
  end
  resources :sessions,      only: [:new, :create, :destroy]
  resources :activities,    only: [:new, :create, :destroy] 
  get 'tags/:tag', to: 'foods#show', as: :tag, 
                                     requirements: {:tag => /tag/i }
  resources :details  
  resources :ratings,       only: [:new, :create, :destroy, :update, :edit] do
    resources :lists
  end
  resources :relationships, only: [:create, :destroy]
  resources :product_types
  resources :foods,    path: 'food'
  resources :chefs,    path: 'chef'
  resources :cultures, path: 'culture'
  resources :cuisines, path: 'cuisine'
  resources :user_profiles
  root to: 'home#index', :controller => 'home'
  match '/signup',    to: 'users#new',              via: 'get'
  match '/signin',    to: 'sessions#new',           via: 'get'
  match '/signout',   to: 'sessions#destroy',       via: 'delete'
  match '/about',     to: 'static_pages#about',     via: 'get'
  match '/start',     to: 'static_pages#start',     via: 'get'
  match '/mission',   to: 'static_pages#mission',   via: 'get'
  match '/contact',   to: 'static_pages#contact',   via: 'get'
  match '/cultivate', to: 'static_pages#cultivate', via: 'get'
  match '/discover',  to: 'static_pages#discover',  via: 'get'
end
