class Employee < ActiveRecord::Base
  include DisplayName
  
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
