Makhnopub::Application.routes.draw do

  namespace :api do
    post :login, to: "sessions#create"
    resources :table_reservations, only: [:create, :update]
    namespace :table_reservations do
      resources :available_from_times, only: :index
      resources :available_to_times, only: :index
      resources :available_tables, only: :index
      resource :latest, only: :show
    end
  end

  namespace :admin do
    resources :casts do
      resources :materials do
        resources :articles
      end
    end
    resources :articles, only: [:new, :create]
    resources :materials, only: :index
  end

  resources :articles

  resources :orders do
    put :close, :on => :member
    get :download, :on => :member
    get :statistic, :on => :collection
  end
  resources :arrivals do
    get :download, :on => :collection
  end
  resources :sales do
    get :download, :on => :collection
  end
  resources :menus do
    get :table, :on => :collection
  end
  resources :products do
    put :clear, :on => :collection
  end
  resources :ingredients
  resources :categories
  resources :posters
  resources :slides
  resources :menu_pages
  resources :statuses
  resources :table_reservations
  resources :table_reservation_blackout_dates
  #resources :locations

  devise_for :users
  resources :users

  match 'home' => 'welcome#index'
  match 'contact' => 'welcome#contact'
  match 'about' => 'welcome#about'
  root :to => 'welcome#index'

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
  # just remember to delete public/fill.html.
  # root :to => 'welcome#fill'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
