Damagemiseh::Application.routes.draw do

  devise_for :users, :path =>'', :path_names => { :sign_in => 'login', :sign_out => 'logout', 
                                                  :sign_up => 'register'}

  devise_scope :user do
    get "login",    :to => "users/sessions#new"
    delete "logout",   :to => "users/sessions#destroy"
    get "register", :to => "users/registrations#new"
    get "delete",   :to => "users/registrations#destroy"
    get "settings", :to => "users/registrations#edit"
  end 

  root 'pages#home'

  resources :products
  resources :line_items
  resources :payment_notifications
  resources :carts

  get "store", :to =>  "products#index"

  get "about",    to: "pages#about"
  get "contact",  to: "pages#contact"

  get "mycart", :controller => 'carts', :action => 'show', :id => 'current'


  resources :posts

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

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end