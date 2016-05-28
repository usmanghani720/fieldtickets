module SimpleForm
  module Components
    module Errors
      def error_text
        text = has_custom_error? ? options[:error] : errors.send(error_method)

        "#{html_escape(options[:error_prefix])} #{text}".lstrip.html_safe
      end
      
    end
  end
end