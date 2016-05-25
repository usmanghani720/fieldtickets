# Use the selectpicker class for Rails enum <select> inputs

class EnumHelp::SimpleForm::EnumInput < ::SimpleForm::Inputs::CollectionSelectInput
  include EnumHelp::SimpleForm::InputExtension
  def input_html_classes
    super.push('selectpicker')
  end
end