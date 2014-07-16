Myapp::Application.routes.draw do
 
  resources :reviews, only: [:create, :destroy]

  resources :ratings, only: [:create, :update]

  resources :items

  resources :orders

  resources :sessions_customer, only: [:new, :create, :destroy]
  resources :sessions_restaurant, only: [:new, :create, :destroy]

  resources :restaurants

  resources :customers


  root to: 'static_pages#home'

  
  # signup routes
  match '/customersignup', to: 'customers#new'
  match '/restaurantsignup', to: 'restaurants#new'

  #customer signin
  match '/customersignin',  to: 'sessions_customer#new', via: :get
  match '/customersignin',  to: 'sessions_customer#create', via: :post
  match '/customersignout', to: 'sessions_customer#destroy', via: :delete
  
  # restaurant sign in
  match '/restaurantsignin',  to: 'sessions_restaurant#new', via: :get
  match '/restaurantsignin',  to: 'sessions_restaurant#create', via: :post
  match '/restaurantsignout', to: 'sessions_restaurant#destroy', via: :delete

  # restaurant index
  match '/restaurants', to: 'restaurants#index'

  # reviews index
  match '/reviews', to: 'reviews#index'

  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
