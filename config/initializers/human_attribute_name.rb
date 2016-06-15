# Overrides human_attribute_name so model attributes are title case.
# Combine with the titleize gem which overrides String#titleize with English-language rules.
module ActiveModel::Translation
  def human_attribute_name(attribute, options = {})
    options   = { count: 1 }.merge!(options)
    parts     = attribute.to_s.split(".")
    attribute = parts.pop
    namespace = parts.join("/") unless parts.empty?
    attributes_scope = "#{self.i18n_scope}.attributes"

    if namespace
      defaults = lookup_ancestors.map do |klass|
        :"#{attributes_scope}.#{klass.model_name.i18n_key}/#{namespace}.#{attribute}"
      end
      defaults << :"#{attributes_scope}.#{namespace}.#{attribute}"
    else
      defaults = lookup_ancestors.map do |klass|
        :"#{attributes_scope}.#{klass.model_name.i18n_key}.#{attribute}"
      end
    end

    defaults << :"attributes.#{attribute}"
    defaults << options.delete(:default) if options[:default]
    defaults << attribute.titleize

    options[:default] = defaults
    I18n.translate(defaults.shift, options)
  end
end

# If you're using Rails enums and the enum_help gem to make them translatable, use this code to default to titleize instead of humanize
module EnumHelp::Helper
  def self.translate_enum_label(klass, attr_name, enum_label)
    ::I18n.t("enums.#{klass.to_s.underscore.gsub('/', '.')}.#{attr_name}.#{enum_label}", default: enum_label.titleize)
  end
end