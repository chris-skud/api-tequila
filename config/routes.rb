Rails.application.routes.draw do

  get 'producers' => 'producer#index'
  get 'producers/:id' => 'producer#show'
  post 'producers' => 'producer#create'
  patch 'producers/:id' => 'producer#update'
  delete 'producers/:id' => 'producer#delete'

  get 'brands' => 'brand#index'
  get 'brands/:id' => 'brand#show'
  post 'brands' => 'brand#create'
  patch 'brands/:id' => 'brand#update'
  delete 'brands/:id' => 'brand#delete'

  get 'products' => 'product#index'
  get 'products/:id' => 'product#show'
  post 'products' => 'product#create'
  patch 'products/:id' => 'product#update'
  delete 'products/:id' => 'product#delete'

  get '*unmatched_route', to: 'application#not_found'


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
