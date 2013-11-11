namespace :redis do
  desc "Install latest stable release of redis"
  task :install, roles: :web do
    run "#{sudo} add-apt-repository -y ppa:chris-lea/redis-server"
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install redis-server"
  end
  after "deploy:install", "redis:install"

  %w[start stop restart].each do |command|
    desc "#{command} nginx"
    task command, roles: :web do
      run "#{sudo} service redis-server #{command}"
    end
  end
end
