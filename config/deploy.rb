require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rails"
load "config/recipes/rbenv"
load "config/recipes/check"
#load "config/recipes/api_keys"

server "198.199.115.184", :web, :app, :db, primary: true

set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"

set :github_user, "railsfanatic"
set :user, "deployer"
set :application, "cpnjysep"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:#{github_user}/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
