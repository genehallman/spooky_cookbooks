default['ruby-ng']['ruby_version'] = "2.4"
default['nodejs']['version'] = "6.10.1"
default['nodejs']['npm']['version'] = "5.2.0"
default['nginx']['default_site_enabled'] = false

default[:spooky][:git_repository] = "https://github.com/chungkikelly/spooky/"
default[:spooky][:git_revision] = "master"
default[:spooky][:path] = "/opt/spooky"

default[:spooky][:rails_serve_static_files] = "true"
default[:spooky][:secret_key_base] = "3bcaa9e533f76d24e9f9eb8d4c267da75cad1c70950d329698e5f387d8a4c0f2cb323ddecfb2b586232bb707e32a9c9ccfa61b7528d1ff0644f47651e98b0974"
default[:spooky][:database_url] = "postgres://spooky:superspooky@spooky-restore.czw89thqzdvd.us-west-2.rds.amazonaws.com:5432/spooky_production"
default[:spooky][:rails_env] = "production"

environment = {
  "RAILS_SERVE_STATIC_FILES": "true",
  "SECRET_KEY_BASE": "3bcaa9e533f76d24e9f9eb8d4c267da75cad1c70950d329698e5f387d8a4c0f2cb323ddecfb2b586232bb707e32a9c9ccfa61b7528d1ff0644f47651e98b0974",
  "DATABASE_URL": "postgres://spooky:superspooky@spooky-restore.czw89thqzdvd.us-west-2.rds.amazonaws.com:5432/spooky_production",
  "RAILS_ENV": "production"
}

env_str = environment.map {|k,v| "#{k}=#{v}"}.join(' ')

default[:spooky][:start_cmd] = "#{env_str} unicorn -E production -c #{node[:spooky][:path]}/config/unicorn.rb"