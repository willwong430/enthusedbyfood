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
  resources :foods, path: 'food'
  resources :chefs
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
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
