class CollectionSelectInput < SimpleForm::Inputs::CollectionInput
  def input
    input_html_classes << 'selectpicker'
    super
  end
end