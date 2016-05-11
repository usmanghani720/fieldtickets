Rails.application.routes.draw do
  namespace :timesheet do
    resources :equipment_entries
  end
  namespace :timesheet do
    resources :scaffold_entries
    resources :employee_entries
  end
  
  resources :timesheets, module: :timesheet
  
  resources :field_tickets, path: 'tickets' do
    get :autocomplete_job_internal_number, on: :collection
    get :autocomplete_equipment_internal_number, on: :collection
    
    get :job
    
    get :employees
    
    get :delays
    
    get :vehicles
    get 'vehicles/add' => 'field_tickets#vehicles_add', as: :add_vehicle
    post 'vehicles/add' => 'field_tickets#vehicles_create'
    post 'vehicles/:equipment_entry_id/:new_status' => 'field_tickets#vehicles_update', as: :vehicle_update
    get 'vehicles/:equipment_entry_id' => 'field_tickets#vehicles_log', as: :vehicle_log
    
    get :supplies
    
    get :dimensions
    
    get :approval
    get 'approval/approve' => 'field_tickets#approve'
    get 'approval/disapprove' => 'field_tickets#disapprove'
  end
  
  resources :equipment, path: 'vehicles'
  
  resources :jobs do
    get :autocomplete_customer_name, on: :collection
  end
  
  resources :customers
  resources :employees
  
  devise_for :users
  
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
