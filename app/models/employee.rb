class Employee < ActiveRecord::Base
  include DisplayName
  
  acts_as_paranoid
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable
  
  def email_required?
    false
  end
  
  def password_required?
    false
  end
  
  def to_s
    if nickname.present? and internal_number.present?
      "“#{nickname}” #{name} (##{internal_number})"
    elsif internal_number.present?
      "#{name} (##{internal_number})"
    elsif nickname.present?
      "“#{nickname}” #{name}"
    else
      name
    end
  end
  
end
