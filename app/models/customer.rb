class Customer < ActiveRecord::Base
  has_many :jobs
  
  default_scope { order(:name) }
  
  acts_as_paranoid
  
  def reference_name
    to_s
  end
  
  def to_s
    name
  end
  
end
