
##### Settings #####

# the name of your website - should also be the name of the directory
set :application, "building.seesparkbox.com"

# the url that maps to the server - in staging this could be different that the application name
set :application_url, "building.seesparkbox.com"

# the path to your new deployment directory on the server
# by default, the name of the application (e.g. "/var/www/sites/example.com")
set :deploy_to, "/var/www/html/#{application}"

# the git-clone url for your repository
set :repository, "git@github.com:sparkbox/sparkbox-website.git"

# the branch you want to clone (default is master)
set :branch, "master"

# the name of the deployment user-account on the server
set :user, "root"

ssh_options[:forward_agent] = true

##### You shouldn't need to edit below unless you're customizing #####

# Additional SCM settings
set :scm, :git
set :ssh_options, { :forward_agent => true }
set :deploy_via, :remote_cache
set :copy_strategy, :checkout
set :keep_releases, 3
set :use_sudo, false
set :copy_compression, :bz2

# Roles
role :app, "#{application_url}"
role :web, "#{application_url}"
role :db,  "#{application_url}", :primary => true