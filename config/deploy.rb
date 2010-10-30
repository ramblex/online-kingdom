set :application, "online-kingdom"
set :repository,  "ssh://git@178.79.132.38/home/git/online-kingdom.git"
set :user, "onlinek"
ssh_options[:forward_agent] = true

default_run_options[:pty] = true

set :deploy_to, "/home/onlinek/public_html/#{application}"
set :deploy_via, :remote_cache

set :default_environment, {
  'PATH' => '/var/lib/gems/1.8/bin:$PATH'
}

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "94.46.15.116"                          # Your HTTP server, Apache/etc
role :app, "94.46.15.116"                          # This may be the same as your `Web` server
role :db,  "94.46.15.116", :primary => true # This is where Rails migrations will run

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
    run "ln -sfn /home/onlinek/public_html/#{application}/shared/database.yml #{release_path}/config/database.yml"
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
