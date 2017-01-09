module FxActiveRecord

  extend ActiveSupport::Concern

  # add your instance methods here
  def flash(method)
    case method
    when :create
      self.model_reference_name + ' was successfully created.'
    when :update
      self.model_reference_name + ' was successfully updated.'
    when :destroy
      self.model_reference_name + ' was successfully deleted.'
    when :confirm_destroy
      "Are you sure you want to delete #{self}?"
    else
      raise "FxActiveRecord: flash(param) `#{method}` not found."
    end
  end
  
  def humanize
    self.class.human
  end
  
  def reference_name
  end
  
  def model_reference_name
    if reference_name
      "#{humanize} “#{reference_name}”"
    else
      humanize
    end
  end

  # add your static(class) methods here
  module ClassMethods
    
    def human
      model_name.human
    end
    
    def humans
      model_name.human count: 2
    end
    
  end
end

# include the extension 
ActiveRecord::Base.send(:include, FxActiveRecord)
