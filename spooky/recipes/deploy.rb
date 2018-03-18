# deploy script here
git "#{Chef::Config[:file_cache_path]}/spooky" do
  repository node[:app_name][:git_repository]
  revision node[:app_name][:git_revision]
  action :sync
end

