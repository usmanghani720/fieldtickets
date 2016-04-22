class Customer < ActiveRecord::Base
  has_many :jobs
  
  default_scope do
    order(:name)
  end
  
  def to_s
    name
  end
end
