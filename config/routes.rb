Rails.application.routes.draw do

  devise_for :employees
  
  namespace :reports do
    get 'payroll' => 'payroll#show'
  end
  
  scope module: 'ticket' do
    get 'tickets/finalized' => 'tickets#index_finalized'
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
      delete 'employees/:employee_id/edit/:employee_entry_id' => 'employees#delete_status'

      get 'vehicles' => 'vehicles#index'
      get 'vehicles/add' => 'vehicles#new'
      post 'vehicles/add' => 'vehicles#create'
      get 'vehicles/:vehicle_id' => 'vehicles#show', as: :vehicle_log
      post 'vehicles/:vehicle_id/:status' => 'vehicles#create_status', as: :vehicle_new_status
      get 'vehicles/:vehicle_id/edit/:vehicle_entry_id' => 'vehicles#edit_status', as: :vehicle_edit_status
      patch 'vehicles/:vehicle_id/edit/:vehicle_entry_id' => 'vehicles#update_status'
      delete 'vehicles/:vehicle_id/edit/:vehicle_entry_id' => 'vehicles#delete_status'
      
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
      
      collection do
        get :autocomplete_job_display_name
        
        get :autocomplete_vehicle_display_name
        
        #get :autocomplete_employee_display_name
        
        get 'autocomplete_crew_chief_display_name' => 'job#autocomplete_employee_display_name'
        
        get 'autocomplete_worker_display_name' => 'employees#autocomplete_employee_display_name'
      end
    end
  end
  

  
  namespace :admin do
    resources :customers
    resources :employees
    resources :vehicles
    resources :jobs do
      get :autocomplete_customer_name, on: :collection
    end
    
    get 'approval/approved' => 'approval#index_approved'
    resources :approval do
      patch :approve
    end
  end
  
  root 'application#homepage'

end
