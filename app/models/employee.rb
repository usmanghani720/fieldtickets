class Employee < ActiveRecord::Base
  include CreatedBy
  include DisplayName
  
  acts_as_paranoid
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  enum role: { unknown: 0, manager: 2, crew_chief: 3, worker: 4, other: 1 }
  
  validates :name, presence: true
  validates :role, presence: true
  
  # Simple method to say if user has credentials to log in.
  def can_log_in?
    not (encrypted_password.blank? or email.blank?)
  end
  
  # Hooks in with Devise so every employee isn't required to have email.
  def email_required?
    false
  end
  
  # Hooks in with Devise so every employee isn't required to have password.
  def password_required?
    false
  end
  
  # “Ollie” Oliver Anson (32)
  def to_s
    the_name = ''
    the_name << "“#{nickname}” " if nickname.present?
    the_name << (name || 'Unnamed Employee')
    the_name << " (#{internal_number})" if internal_number.present?
    the_name
  end
  
end
