class Employee < ActiveRecord::Base
  include CreatedBy
  include DisplayName
  
  has_many :ticket_employees, class_name: 'Ticket::Employee'
  has_many :tickets, through: :ticket_employees, class_name: 'Ticket::Ticket'
  
  acts_as_paranoid
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  enum role: { unknown: 0, manager: 2, crew_chief: 3, worker: 4, other: 1 }
  
  validates :name, presence: true
  validates :role, presence: true
  
  after_save :update_ticket_employees
  
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
  
  # Is able to log in (via Devise)?
  def active_for_authentication?
    manager? or crew_chief?
  end
  
  private
  
    def update_ticket_employees
      if display_name_changed?
        ticket_employees.each do |employee|
          employee.cache_display_name!
        end
      end
    end
  
end
