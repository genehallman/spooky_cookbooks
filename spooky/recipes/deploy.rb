service "spooky" do
  action [:stop]
end 

# deploy script here
git "#{node[:spooky][:path]}" do
  repository node[:spooky][:git_repository]
  revision node[:spooky][:git_revision]
  action :sync
end

directory "#{node[:spooky][:path]}" do
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
  recursive True
  action :create
end

execute "Install Gems" do
  cwd node[:spooky][:path]
  command "bundle install"
  user "ubuntu"
  # group new_resource.group
  # environment npm_env_vars
  # not_if { package_installed? }
end

execute "Install NPM packages" do
  cwd node[:spooky][:path]
  command "npm install"
  user "ubuntu"
  # group new_resource.group
  # environment npm_env_vars
  # not_if { package_installed? }
end

execute "Compile Webpack Assets" do
  cwd node[:spooky][:path]
  command "./node_modules/.bin/webpack"
  environment ({"NODE_ENV": "production"})
  user "ubuntu"
end

execute "Compile Rails Assets" do
  cwd node[:spooky][:path]
  command "rake assets:precompile"
  environment ({"RAILS_ENV": "production"})
  user "ubuntu"
end

service "spooky" do
  action [ :enable, :start ]
end 
