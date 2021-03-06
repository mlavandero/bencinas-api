require "rvm/capistrano"
require "bundler/capistrano"
require 'new_relic/recipes'

after "deploy:update_code", "newrelic:notice_deployment"

# adjust if you are using RVM, remove if you are not​
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
set :user, "ubuntu"
set :domain, "mls-ec2"
set :application, "bencinas"

set :rvm_ruby_string, "1.9.3"
set :rvm_type, :user

# file paths​
set :repository, "git@github.com:mlavandero/bencinas-api.git"
set :deploy_to, "/home/#{user}/#{application}"

# distribute your applications across servers (the instructions below put them
# all on the same server, defined above as 'domain', adjust as necessary)
role :app, domain
role :web, domain
role :db, domain, :primary => true

# you might need to set this if you aren't seeing password prompts
default_run_options[:pty] = true

# As Capistrano executes in a non-interactive mode and therefore doesn't cause
# any of your shell profile scripts to be run, the following might be needed
# if (for example) you have locally installed gems or applications.  Note:
# this needs to contain the full values for the variables set, not simply
# the deltas.
# default_environment['PATH']='<your paths>:/usr/local/bin:/usr/bin:/bin'
# default_environment['GEM_PATH']='<your paths>:/usr/lib/ruby/gems/1.8'

# miscellaneous options​
set :deploy_via, "remote_cache"
set :scm, "git"
set :branch, "master"
set :scm_verbose, false
set :use_sudo, false
set :rails_env, :production

before "deploy:create_symlink", "deploy:crontab"
after "deploy:finalize_update", "deploy:configuraciones"

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end

  desc "copiar configuracion de database.yml"
  task :configuraciones do
    run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -s #{shared_path}/config/newrelic.yml #{release_path}/config/newrelic.yml"
  end

  desc "actualiza crontab"
  task :crontab do
    run "cat #{release_path}/config/cron.txt | crontab -"
  end

  desc "ejecutar actualizacion de precios"
  task :rake_actualizar_precios do
    run "cd #{current_path}; bundle exec rake bencina:actualizar_precios RAILS_ENV=#{rails_env}"
  end

end

after "deploy:update_code", :bundle_install
  desc "install the necessary prerequisites"
  task :bundle_install, :roles => :app do
    run "cd #{release_path} && bundle install"
  end