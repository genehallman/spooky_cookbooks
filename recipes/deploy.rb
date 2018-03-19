# deploy script here
git "#{Chef::Config[:file_cache_path]}/spooky" do
  repository node[:spooky][:git_repository]
  revision node[:spooky][:git_revision]
  action :sync
end

