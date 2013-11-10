require 'active_support/core_ext/string'
namespace :deploy do
  desc "Set API keys for Twitter & Instagram"
  task :set_api_keys, roles: :web do
    x = capture "cat #{current_path}/Gemfile"
    puts x
    exit
    keys = [
      "instagram_client_id",
      "instagram_client_secret",
      "instagram_user_id",
      "twitter_consumer_key",
      "twitter_consumer_secret"
    ]
    settings = {}
    keys.each do |key|
      set(key) { Capistrano::CLI.ui.ask("#{key}: ") }
      settings[key] = "#{eval(key)}"
    end
    puts settings.to_yaml
  end
  after "deploy:install", "nginx:install"
end
