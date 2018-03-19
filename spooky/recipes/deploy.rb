# deploy script here
git "#{node[:spooky][:path]}" do
  repository node[:spooky][:git_repository]
  revision node[:spooky][:git_revision]
  action :sync
end

execute "Install Gems" do
  cwd node[:spooky][:path]
  command "bundle install"
  # user new_resource.user
  # group new_resource.group
  # environment npm_env_vars
  # not_if { package_installed? }
end

execute "Install NPM packages" do
  cwd node[:spooky][:path]
  command "npm install"
  # user new_resource.user
  # group new_resource.group
  # environment npm_env_vars
  # not_if { package_installed? }
end