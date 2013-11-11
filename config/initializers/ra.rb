Rack::RedisAnalytics.configure do |configuration|
  configuration.redis_connection = Redis.new(:host => 'localhost', :port => '6379')
  configuration.redis_namespace = 'ra'
  configuration.dashboard_endpoint = '/analytics'
end
