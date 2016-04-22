class Customer < ActiveRecord::Base
  has_many :jobs
  
  def to_s
    name
  end
end
