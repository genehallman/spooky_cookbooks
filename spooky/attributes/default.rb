default['ruby-ng']['ruby_version'] = "2.4"
default['nodejs']['version'] = "6.10.1"
default['nodejs']['npm']['version'] = "5.2.0"
default['nginx']['default_site_enabled'] = false

default[:spooky][:git_repository] = "https://github.com/chungkikelly/spooky/"
default[:spooky][:git_revision] = "master"
default[:spooky][:path] = "/opt/spooky"

default[:spooky][:rails_env] = "production"

environment = {
  "SECRET_KEY_BASE": default[:spooky][:secret_key_base],
  "DATABASE_URL": default[:spooky][:database_url],
  "RAILS_ENV": default[:spooky][:rails_env]
}

if node[:spooky][:cdn_host].present? and node[:spooky][:jenkins_git_commit].present?
  environment["CDN_HOST"] = "#{node[:spooky][:cdn_host]}/#{node[:spooky][:jenkins_git_commit]}/"
else
  environment["RAILS_SERVE_STATIC_FILES"] = "true"
end

env_str = environment.map {|k,v| "#{k}=#{v}"}.join(' ')

default[:spooky][:start_cmd] = "#{env_str} unicorn -E production -c /opt/unicorn.rb"