# Cookbook Name:: sphinxsearch
# Recipe:: default
#

if not %{ package source }.include? node['sphinxsearch']['install_method']
  Chef::Application.fatal! "Unknown sphinxsearch/install_method is set"
end

Chef::Log.info "include_recipe #{cookbook_name}::#{node['sphinxsearch']['install_method']}"
include_recipe "#{cookbook_name}::#{node['sphinxsearch']['install_method']}"
