service "spooky" do
  action [:stop]
end 

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

execute "Compile Webpack Assets" do
  cwd node[:spooky][:path]
  command "./node_modules/.bin/webpack"
  environment {"NODE_ENV": "production"}
end

execute "Compile Rails Assets" do
  cwd node[:spooky][:path]
  command "rake assets:precompile"
  environment {"RAILS_ENV": "production"}
end

# execute "Start server" do
#   cwd node[:spooky][:path]
#   command "rails server"
#   environment {
#     "RAILS_SERVE_STATIC_FILES": "true",
#     "SECRET_KEY_BASE": "3bcaa9e533f76d24e9f9eb8d4c267da75cad1c70950d329698e5f387d8a4c0f2cb323ddecfb2b586232bb707e32a9c9ccfa61b7528d1ff0644f47651e98b0974",
#     "DATABASE_URL": "postgres://spooky:superspooky@spooky-restore.czw89thqzdvd.us-west-2.rds.amazonaws.com:5432/spooky_production",
#     "RAILS_ENV": "production"
#   }
# end

service "spooky" do
  action [ :enable, :start ]
end 
