# deploy script here
git "#{node[:spooky][:path]}" do
  repository node[:spooky][:git_repository]
  revision node[:spooky][:git_revision]
  action :sync
end
