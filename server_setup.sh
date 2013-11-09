#!/bin/bash
# To be executed on first login of new VPS
# 11/9/2013 -- Ubuntu 12.04.3 x64

echo -e "Please enter new admin password:"
read -s password1
echo -e "Please repeat the new password:"
read -s password2

# Check both passwords match
if [ $password1 != $password2 ]; then
  echo -e "Passwords do not match"
  exit
fi
unset password2

echo -e "\n\n\nStarting server build at:"
date
start_time=$(date +"%s")

# Change password
echo -e "$password1\n$password1" | passwd

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62 7FCC7D46ACCC4CF8

cat <<EOF >> /etc/apt/sources.list
  # nginx
  deb http://nginx.org/packages/ubuntu/ precise nginx
  deb-src http://nginx.org/packages/ubuntu/ precise nginx

  # postgresql
  deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main
EOF

echo -e "\n\n\nUpdating apt & upgrading packages ...\n\n\n"
apt-get -y update
apt-get -y upgrade

echo -e "\n\n\nInstalling curl & git-core ... \n\n\n"
apt-get -y install curl git-core

echo -e "\n\n\nInstalling nginx & Postgres ... \n\n\n"
apt-get -y install nginx postgresql-9.3 libpq-dev
service nginx start

echo -e "\n\n\nSetting up Postgres ... \n\n\n"
sudo -u postgres psql << EOF
  create user cpnjysep with password 'cpnjysep_secret';
  create database cpnjysep owner cpnjysep;
  \q
EOF

echo -e "\n\n\nInstalling & setting up Postfix ... \n\n\n"
debconf-set-selections <<< "postfix postfix/mailname string cpnjysep.com"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
apt-get -y install telnet postfix

echo -e "Installing node.js ... "
apt-get -y install python g++ make
add-apt-repository -y ppa:chris-lea/node.js
apt-get -y update
apt-get -y install nodejs

echo -e "Installing Ruby dependencies ... "
apt-get -y install build-essential tklib zlib1g-dev libssl-dev libreadline-gplv2-dev libxml2 libxml2-dev libxslt1-dev
apt-get -y upgrade

echo -e "$password1\n$password1" | adduser --gecos "" deployer --ingroup sudo
unset password1

prepend='
cd ~
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi
'
echo -e "$prepend\n$(cat /home/deployer/.bashrc)" > /home/deployer/.bashrc

export RBENV_ROOT="/home/deployer/.rbenv"
export HOME=/home/deployer
su - deployer -c 'curl https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash'
su - deployer -c 'rbenv install 2.0.0-p247'
su - deployer -c 'rbenv global 2.0.0-p247'
su - deployer -c 'gem install bundler --no-ri --no-rdoc'
su - deployer -c 'rbenv rehash'
su - deployer -c 'mkdir /home/deployer/.ssh && ssh-keyscan -H github.com >> /home/deployer/.ssh/known_hosts && ssh-keyscan -H 192.30.252.129 >> /home/deployer/.ssh/known_host'
sed -i "s/#PermitRootLogin/PermitRootLogin/g" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config

su - deployer -c "ssh-keygen -f /home/deployer/.ssh/id_rsa -t rsa -N ''"
echo "Subject: Server Public Key" | cat - /home/deployer/.ssh/id_rsa.pub | sendmail -t tom@grushka.com

echo -e "\n\n\nFinished server build at:"
date
end_time=$(date +"%s")
diff=$(($end_time-$start_time))

echo -e "\n\n\n$(($diff / 60)) minutes $(($diff % 60)) seconds elapsed.\n\n"
