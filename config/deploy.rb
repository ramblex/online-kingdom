set :application, "online-kingdom"
set :repository, "git@github.com:ramblex/online-kingdom.git"
set :user, "alexd"
set :ip, "178.79.140.129"
ssh_options[:forward_agent] = true

default_run_options[:pty] = true

set :deploy_to, "/home/#{user}/public_html/#{application}"
set :deploy_via, :remote_cache

set :default_environment, {
  'PATH' => '/var/lib/gems/1.8/bin:$PATH'
}

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, ip                          # Your HTTP server, Apache/etc
role :app, ip                          # This may be the same as your `Web` server
role :db,  ip, :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_shared do
    run "ln -sfn /home/#{user}/public_html/#{application}/shared/database.yml #{release_path}/config/database.yml"
    run "ln -sfn /home/#{user}/public_html/#{application}/shared/amazon_s3.yml #{release_path}/config/amazon_s3.yml"
    run "ln -sfn /home/#{user}/public_html/#{application}/shared/s3.yml #{release_path}/config/s3.yml"
    run "ln -sfn /home/#{user}/public_html/#{application}/shared/zencoder.yml #{release_path}/config/zencoder.yml"
    run "ln -sfn /home/#{user}/public_html/#{application}/shared/environment.rb #{release_path}/config/environment.rb"
  end

  task :copy_uploads do
    prev_dir = "#{previous_release}/public/system"
    run "[ -d #{prev_dir} ] && cp -R #{prev_dir} #{latest_release}/public/ || echo 'No previous uploads'"
  end

  task :copy_insider_files do
    prev_dir = "#{previous_release}/assets"
    run "[ -d #{prev_dir} ] && cp -R #{prev_dir} #{latest_release}/ || echo 'No previous insider files'"
  end

  after 'deploy:update_code', 'deploy:symlink_shared', "deploy:copy_uploads", "deploy:copy_insider_files"
end
