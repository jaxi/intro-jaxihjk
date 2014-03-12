server "jaxihjk.me", :web, :app, :db, primary: true

set :application, "intro-jaxihjk"
set :user, "jaxi"
set :deploy_to, "/home/#{user}/web_apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:jaxi/intro-jaxihjk.git"
set :branch, "original"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

namespace :deploy do
  task :setup_nginx_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-available/#{application}"
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
  end

  after "deploy:setup", "deploy:setup_nginx_config"
end