Rails.application.routes.draw do
  # namespace :ticket do
  # get 'vehicles/index'
  # end

  devise_for :employees
  
  namespace :reports do
    get 'payroll' => 'payroll#show'
  end
  
  scope module: 'ticket' do
    resources :tickets do
      get 'job' => 'job#index'
      patch 'job' => 'job#update'
      
      get 'employees' => 'employees#index'
      get 'employees/add' => 'employees#new'
      post 'employees/add' => 'employees#create'
      get 'employees/:employee_id' => 'employees#show', as: :employee_log
      post 'employees/:employee_id/:status' => 'employees#create_status', as: :employee_new_status
      get 'employees/:employee_id/edit/:employee_entry_id' => 'employees#edit_status', as: :employee_edit_status
      patch 'employees/:employee_id/edit/:employee_entry_id' => 'employees#update_status'

      get 'vehicles' => 'vehicles#index'
      get 'vehicles/add' => 'vehicles#new'
      post 'vehicles/add' => 'vehicles#create'
      get 'vehicles/:vehicle_id' => 'vehicles#show', as: :vehicle_log
      post 'vehicles/:vehicle_id/:status' => 'vehicles#create_status', as: :vehicle_new_status
      
      get 'dimensions' => 'dimensions#index'
      patch 'dimensions' => 'dimensions#update'
      
      get 'supplies' => 'supplies#index'
      patch 'supplies' => 'supplies#update'
      
      get 'delays' => 'delays#index'
      patch 'delays' => 'delays#update'
      
      get 'notes' => 'notes#index'
      get 'notes/add' => 'notes#new'
      post 'notes' => 'notes#create'
      
      get 'approval' => 'approval#index'
      get 'approval/:decision' => 'approval#approval_confirm', as: :approval_confirm
      patch 'approval/:decision' => 'approval#update'
      
      
      get 'finalize' => 'finalize#index'
      patch 'finalize' => 'finalize#update'
      
      get :autocomplete_job_display_name, on: :collection
      get :autocomplete_vehicle_display_name, on: :collection
      get :autocomplete_employee_display_name, on: :collection
    end
  end
  
  #resources :field_tickets, path: 'tickets' do
  #  get :autocomplete_job_display_name, on: :collection
  #  get :autocomplete_equipment_display_name, on: :collection
  #  get :autocomplete_employee_display_name, on: :collection
  #  
  #  get :job
  #  
  #  get :employees
  #  get 'employees/add' => 'field_tickets#employees_add', as: :add_employee
  #  post 'employees/add' => 'field_tickets#employees_create'
  #  post 'employees/:employee_entry_id/:new_status' => 'field_tickets#employees_update', as: :employee_update
  #  get 'employees/:employee_entry_id' => 'field_tickets#employees_log', as: :employee_log
  #  get 'employees/:employee_entry_id/edit' => 'field_tickets#employees_log_edit', as: :employee_log_edit
  #  post 'employees/:employee_entry_id' => 'field_tickets#employees_log_new'
  #  patch 'employees/:employee_entry_id' => 'field_tickets#employees_log_update'
  #  delete 'employees/:employee_entry_id' => 'field_tickets#employees_log_destroy'
  #  
  #  get :delays
  #  
  #  get :vehicles
  #  get 'vehicles/add' => 'field_tickets#vehicles_add', as: :add_vehicle
  #  post 'vehicles/add' => 'field_tickets#vehicles_create'
  #  get 'vehicles/:equipment_entry_id/refuel' => 'field_tickets#vehicles_refuel', as: :vehicle_refuel
  #  post 'vehicles/:equipment_entry_id/:new_status' => 'field_tickets#vehicles_update', as: :vehicle_update
  #  get 'vehicles/:equipment_entry_id' => 'field_tickets#vehicles_log', as: :vehicle_log
  #  
  #  get :supplies
  #  
  #  get :dimensions
  #  
  #  get :approval
  #  get 'approval/:decision' => 'field_tickets#approval', as: :approval_decision
  #  patch 'approval/:decision' => 'field_tickets#approval_save'
  #
  #  get :submit
  #  post 'submit' => 'field_tickets#submit_confirm'
  #end
  
  namespace :admin do
    resources :customers
    resources :employees
    resources :vehicles
    resources :jobs do
      get :autocomplete_customer_name, on: :collection
    end
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#homepage'

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
