class Customer < ActiveRecord::Base
  include CreatedBy
  has_many :jobs
  
  default_scope { order(:name) }
  
  validates :name, presence: true
  
  acts_as_paranoid
  
  def to_s
    name
  end
  
end
