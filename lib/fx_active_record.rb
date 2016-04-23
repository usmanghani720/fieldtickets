module FxActiveRecord

  extend ActiveSupport::Concern

  # add your instance methods here
  def flash(method)
    case method
    when :create
      self.reference_name + ' was successfully created.'
    when :update
      self.reference_name + ' was successfully updated.'
    when :destroy
      self.reference_name + ' was successfully destroyed.'
    else
      raise "Flash param `#{method} not found.`"
    end
  end
  
  def reference_name
    self.class.human
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
