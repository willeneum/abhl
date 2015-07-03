Rails.application.routes.draw do

  #-------------------------------------------------------------------------------------------------------------
  # |_URL__________________|_HTTP_Verb_|_Action__|_URL_Helper_______________|_Desciption_________________
  # | /products            | GET       | index   | products_path            | show all items
  # | /products/new        | GET       | new     | new_product_path         | show new form
  # | /products            | POST      | create  | products_path            | create an item
  # | /products/:id        | GET       | show    | product_path(:id)        | show item with :id
  # | /products/:id/edit   | GET       | edit    | edit_product_path(:id)   | show edit from for item with :id
  # | /products/:id        | PATCH     | update  | product_path(:id)        | update item with :id
  # | /products/:id/delete | GET       | delete  | delete_product_path(:id) | show delete form for item with :id
  # | /products/:id        | DELETE    | destroy | product_path(:id)        | delete item with :id
  #---------------------------------------------------------------------------------------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'posts#index'

  # match the action explicitly to try and render the view
  # Example: demo/hello will try to match the 'hello' view before the controller 'demo',
  #  else, go into 'demo' controller to find a view

  #match '/:controller(/:action(/:id))', :via => [:get, :post]

  get 'new_post_cancel', :to => 'posts#cancel'

  resources :posts do
    member do
      get :delete
    end
  end

  resources :players do
    member do
      get :delete
    end
  end

  resources :teams do
    member do
      get :delete
    end
  end

  resources :games do
    member do
      get :delete
    end
    resources :penalty_stats do
      member do
        get :delete
      end
    end
    resources :scoring_stats do
      member do
        get :delete
      end
    end
  end

  post 'access/attempt_login', :to => 'access#attempt_login'
  get 'access/logout', :to => 'access#logout'

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
