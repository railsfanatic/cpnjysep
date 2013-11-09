class DatefieldInput < SimpleForm::Inputs::StringInput
  def input
    input_html_options[:type] ||= :date
    @builder.text_field(attribute_name, input_html_options)
  end
end
