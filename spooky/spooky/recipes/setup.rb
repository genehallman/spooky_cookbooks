# setup script here
include_recipe "ruby"
include_recipe "opsworks_nodejs"
include_recipe "opsworks_postgres"
include_recipe "nginx"
include_recipe "unicorn"
