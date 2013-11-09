require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Cpnjysep
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Mountain Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    
    console do
      AwesomePrint.pry!
      ActiveRecord::Base.logger = Logger.new(STDOUT)
      
      Hirb.enable
      
      old_print = Pry.config.print
      Pry.config.print = proc do |output, value|
        if value.is_a? ActiveRecord::Relation
          Hirb::View.view_or_page_output(value)
        else
          old_print.call(output, value)
        end
      end
    
      config.console = Pry
    end
  end
end
