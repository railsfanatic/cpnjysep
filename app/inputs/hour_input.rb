class HourInput < SimpleForm::Inputs::Base
  def input
    @builder.select(attribute_name, hour_options, { :selected => selected_value }, { :class => "input-medium" })
  end

  private

  # The "Select..." string could also be translated with something like: I18n.t("helpers.select.prompt')
  def hour_options
    hour = [['Select...', '00:00:00']]
    from = @options[:from] || 0
    to = @options[:to] || 23
    (from..to).each do |h|
      %w(00 15 30 45).each do |m|
        hour.push [Time.parse("#{h}:#{m}").strftime("%l:%M %P"), "#{"%02d" % h}:#{m}:00" ]
      end
    end
    hour
  end

  def selected_value
    value = object.send(attribute_name)
    value && value.strftime("%H:%M:%S")
  end
end
