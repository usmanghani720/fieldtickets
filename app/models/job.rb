class Job < ActiveRecord::Base
  belongs_to :customer
  
  def billing
    if flat_rate
      'Day Rate'
    else
      'Hourly'
    end
  end
end
