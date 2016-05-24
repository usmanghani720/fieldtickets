class Customer < ActiveRecord::Base
  has_many :jobs
  
  default_scope { order(:name) }
  
  acts_as_paranoid
  
  def to_s
    name
  end
  
end
