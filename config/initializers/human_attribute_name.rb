# Overrides human_attribute_name so model attributes are title case.
# Combine with the titleize gem which overrides String#titleize with English-language rules.

class ActiveRecord::Base
  def self.human_attribute_name(attr, options = {})
    attr.present? ? super(attr, options).titleize : super
  end
end

# If you're using Rails enums and the enum_help gem to make them translatable, use this code to default to titleize instead of humanize

module EnumHelp::Helper
  def self.translate_enum_label(klass, attr_name, enum_label)
    ::I18n.t("enums.#{klass.to_s.underscore.gsub('/', '.')}.#{attr_name}.#{enum_label}", default: enum_label.titleize)
  end
end