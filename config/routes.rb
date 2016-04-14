Rails.application.routes.draw do
  devise_for :usuarios
  resources :tipo_datos
  resources :estado_operativos
  resources :paginas
  resources :localidads
  resources :estados
  resources :nacions do
    resources :estados do
      resources :localidads
    end
  end
  
  resources :caracter_rol_personas
  resources :rol_personas do
    resources :caracter_rol_personas, :tipo_datos
  end
  
  resources :caracter_tipo_personas
  resources :tipo_personas do
    resources :caracter_tipo_personas, :tipo_datos
  end

  resources :personas do
    resources :tipo_personas, :rol_personas
  end
  resources :caracteristica_tipo_vehiculos
  
  resources :tipo_vehiculos do
    resources :caracteristica_tipo_vehiculos, :tipo_datos
  end
  
  resources :modelo_vehiculos do
    resources :tipo_vehiculos
  end
  
  resources :marca_vehiculos do
    resources :modelo_vehiculos, :tipo_vehiculos
  end

  resources :caracteristica_forma_contactos
  
  resources :forma_contactos do
    resources :caracteristica_forma_contactos, :tipo_datos
  end

  resources :viajes

  get 'bienvenida/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root :to => 'bienvenida#index'

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
