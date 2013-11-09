def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  desc "Install everything onto the server"
  task :install do
    # Disable root ssh login
    run "#{sudo} sed -i 's/#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config"
    run "#{sudo} sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config"
    run "#{sudo} service ssh reload"
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y upgrade"
    run "#{sudo} apt-get -y install python-software-properties"
  end
end
