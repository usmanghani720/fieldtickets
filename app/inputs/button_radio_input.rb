class ButtonRadioInput < SimpleForm::Inputs::CollectionRadioButtonsInput
  def input(wrapper_options)
    
    coll = if collection and collection != [["Yes", true], ["No", false]]
      collection
    else
      object.class.send("#{attribute_name.to_s.pluralize}_i18n").to_a
    end
    
    html_name = if object_name
      "#{object_name}[#{attribute_name}]"
    else
      attribute_name
    end
    
    # Makes it work with decorators
    obj = if object.methods.include? :object
      object.object
    else
      object
    end
    
    current_value = obj.send(attribute_name)
    
    out = '<div class="btn-group" data-toggle="buttons">'
    label_method, value_method = detect_collection_methods
    coll.each do |item|
      #value = item.send(value_method)
      value = item.send(label_method)
      #raise value
      translations = object.class.send("#{attribute_name.to_s.pluralize}_i18n")
      label = item.send(label_method)
      label = translations[label]
      active = ''
      active = ' active' if
          # out =~ / active/ ||
          current_value == value # &&
          # item != coll.last
          
          #raise current_value.inspect
      
      #raise active.inspect if active.present?
      input_html_options[:value] = value unless active.empty?
      
      if (item.is_a? Array) and (item.third.present?)
        btn = "btn btn-#{item.third}"
      else
        btn = 'btn btn-default'
      end
      
      checked_attribute = ' checked="checked"'unless active.empty?
      
      out << <<-HTML
        <label class="#{btn} #{active}">    
          <input type="radio" value="#{value}" name="#{html_name}"#{checked_attribute}>#{label}</input>
        </label>
HTML
    end
    out << "</div>"
    out.html_safe
  end
end
