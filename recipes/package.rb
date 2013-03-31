# Cookbook Name:: sphinxsearch
# Recipe:: package
#

case node['platform_family']
when 'debian'
  package 'sphinxsearch'
when 'rhel'
  include_recipe node['sphinxsearch']['yum_repo'] unless node['sphinxsearch']['yum_repo'].empty?
  package 'sphinx'
else
  Chef::Application.fatal! "The operating system `#{node['platform']}` is not supported by this cookbook."
end
