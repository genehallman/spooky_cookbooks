# deploy script here
git "#{node[:spooky][:path]}" do
  repository node[:spooky][:git_repository]
  revision node[:spooky][:git_revision]
  action :sync
end

  "ruby": {
    "major_version": "2",
    "minor_version": "3",
    "patch_version": "4",
    "pkgrelease": "1",
    "full_version": "2.4",
    "version": "2.4.1"
  },
  "opsworks_nodejs": {
    "version": "6.10.1",
    "pkgrelease": "1"
  }

opsworks_postgres
nginx
unicorn