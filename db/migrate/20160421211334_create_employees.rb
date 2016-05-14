class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.text :name
      t.text :nickname
      t.text :internal_number

      t.text :display_name # cached display name
      
      # roles
      t.boolean :worker
      t.boolean :crew_chief
      t.boolean :manager
      
      
      
      ## Database authenticatable
      t.text :email #,              null: false, default: ""
      t.text :encrypted_password #, null: false, default: ""

      ## Recoverable
      t.text   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.text   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.text   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.text   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at
      
      
      
      t.datetime :deleted_at, index: true
      
      
      
      t.timestamps null: false
    end
  end
end
