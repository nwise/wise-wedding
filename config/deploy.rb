require 'mongrel_cluster/recipes'
require 'capistrano/ext/multistage' # from the capistrano-ext gem 
require 'erb'

# the group that should own most files
set :runner, 'www-data'
set :group, 'staff'
set :application, 'cmsdemo'

# If you aren't using Subversion to manage your source code, specify
# your SCM below:                                                   
set :scm, :git
set :repository,  "git+ssh://git.local.wrladv.com/git/#{application}.git"

# install gem: capistrano_rsync_with_remote_cache
set :deploy_via, :rsync_with_remote_cache        
set :repository_cache, "cached-copy"             
set :rsync_options, "-rz --delete --exclude=.svn --exclude=.git"
ssh_options[:keys] = %w(~/.ssh/id_dsa ~/.ssh/id_rsa)            

# :deploy_via :copy may need this
# http://www.mail-archive.com/capistrano%40googlegroups.com/msg02543.html
set :synchronous_connect, true

# server definitions
server = "spider.wrladv.com"
role :app, server
role :web, "gato.wrladv.com"
role :db,  server, :primary => true

##########################################################################

# check required variables
def check_vars(variables = %w[application])
	variables.each do |v|
		if fetch(v.to_sym) == "not set" or fetch(v.to_sym) == ""
			p "You must set #{v} in deploy.rb before deploying!"
			exit
		end
	end
end

check_vars()

namespace :deploy do
	after "deploy", "deploy:cleanup"

  task :fix_setup_perms do
    run "#{sudo} chown -R #{runner} #{shared_path}/log #{shared_path}/pids #{shared_path}/system"
  end
  after "deploy:setup", "deploy:fix_setup_perms"
  after "deploy:update_code", "deploy:fix_setup_perms"

  task :fix_upload_perms do
    run "#{sudo} chown -R #{runner} #{release_path}/tmp/*"

    # make sure the server-side cache has good permissions too
    run "#{sudo} chgrp -R #{group} #{shared_path}/#{repository_cache}"
    run "#{sudo} chmod -R g+w #{shared_path}/#{repository_cache}"
    # sh -c necessary here because of how cap runs sudo commands; we need the "xargs sudo" to have root
    run "#{sudo} sh -c 'find #{shared_path}/#{repository_cache} -type d -print0 | xargs -0 chmod g+s'"
  end
  after "deploy:update_code", "deploy:fix_upload_perms"

  task :create_attachment_fu_dir do
    run "mkdir -p #{shared_path}/attachment_fu"
    run "#{sudo} chown -R #{runner}:#{group} #{shared_path}/attachment_fu" 
    run "#{sudo} chmod g+ws #{shared_path}/attachment_fu"
  end
  after "deploy:setup", "deploy:create_attachment_fu_dir"

  task :link_attachment_fu_dir do
    run "rm -rf #{release_path}/tmp/attachment_fu"
    run "ln -nfs #{shared_path}/attachment_fu #{release_path}/tmp/attachment_fu"
  end
  after "deploy:update_code", "deploy:link_attachment_fu_dir"
  
  task :create_fckeditor_dir do
    run "mkdir -p #{shared_path}/system/uploads"
    run "#{sudo} chown -R #{runner}:#{group} #{shared_path}/system/uploads"
    run "#{sudo} chmod g+ws #{shared_path}/system/uploads"
  end
  after "deploy:setup", "deploy:create_fckeditor_dir"

  task :link_fckeditor_dir do
    run "rm -rf #{release_path}/public/uploads"
    run "cd #{release_path}/public && ln -nfs system/uploads uploads"
  end
  after "deploy:update_code", "deploy:link_fckeditor_dir"
end

namespace :apache do
  # create mongrel cluster and haproxy config for application
  # mongrel cluster config should must happen on spider AND gato since
  # haproxy config depends on finding a mongrel cluster. the mongrel cluster
  # created on gato is disabled by default since we dont want them starting
  # up and using resources. haproxy config only happens on gato
  # want to integrate mksite but it restarts apache2 and that should
  # not be done via capistrano yet as its too risky
  #desc "Create mongrel_cluster configuration for application"
    task :generate_mongrel_cluster_config, :roles => [:app, :web] do
    run "#{sudo} /usr/local/sbin/generate-mongrel-cluster-config #{application}"
  end
  #desc "Create haproxy configuration for application"
    task :generate_haproxy_config, :roles => :web do
    run "#{sudo} /usr/local/sbin/generate-haproxy-config #{application}"
  end
  before "apache:setup", "apache:generate_mongrel_cluster_config", "apache:generate_haproxy_config"

	# run mksite with -r flag for rails site
	desc "Setup Apache including proxying to app and reload config"
	task :setup, :roles => :web do
		set :domain, Capistrano::CLI.ui.ask("Domain (example.org): ")
		run "#{sudo} /usr/local/sbin/mksite #{domain} -r"
	end
end

#####################################################################

# we don't keep database.yml in subversion, so write one with capistrano
# http://shanesbrain.net/2007/5/30/managing-database-yml-with-capistrano-2-0
# see also:
# http://www.jvoorhis.com/articles/2006/07/07/managing-database-yml-with-capistrano
# http://jonathan.tron.name/articles/2006/07/15/capistrano-password-prompt-tips
set :db_adapter, "mysql"
set :db_socket, "/var/run/mysqld/mysqld.sock"
set :db_host, "192.168.0.162"
set :db_user, "#{application}"

before "deploy:setup", :db
after "deploy:update_code", "db:symlink"

namespace :db do
  desc "Create database yaml in shared path"
  task :default do
    set :db_password, `/usr/bin/pwgen -1s 20` # FIXME: want to create user with this pw

    db_config = ERB.new <<-EOF
base: &base
  adapter: #{db_adapter}
  reconnect: true
  socket: #{db_socket}
  host: #{db_host}
  username: #{db_user}
  password: #{db_password}

development:
  #database: #{application}_development
  database: #{application}
  <<: *base

test:
  database: #{application}_test
  <<: *base

production:
  #database: #{application}_production
  database: #{application}
  <<: *base
EOF
    run "mkdir -p #{shared_path}/config"
    put db_config.result, "#{shared_path}/config/database.yml"
  end
  
  desc "Make symlink for database yaml"
  task :symlink do
    run "rm -rf #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

