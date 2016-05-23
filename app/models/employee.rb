class Employee < ActiveRecord::Base
  include DisplayName
  
  acts_as_paranoid
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  def can_log_in?
    not (encrypted_password.blank? or email.blank?)
  end
  
  def email_required?
    false
  end
  
  def password_required?
    false
  end
  
  def reference_name
    to_s
  end
  
  def to_s
    the_name = ''
    the_name << "“#{nickname}” " if nickname.present?
    the_name << (name || 'Unnamed Employee')
    the_name << " (#{internal_number})" if internal_number.present?
    the_name
  end
  
end
