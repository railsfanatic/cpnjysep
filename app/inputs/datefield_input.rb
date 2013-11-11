class DatefieldInput < SimpleForm::Inputs::StringInput
  def input
    input_html_options.reverse_merge!({
      "type" => :date,
      "data-date-autoclose" => "true"
      })
    @builder.text_field(attribute_name, input_html_options)
  end
end
