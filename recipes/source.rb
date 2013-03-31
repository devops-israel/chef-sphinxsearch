# Cookbook Name:: sphinxsearch
# Recipe:: source
#

include_recipe "build-essential"
include_recipe "mysql::client" if node['sphinxsearch']['source']['use_mysql']
include_recipe "postgresql::client" if node['sphinxsearch']['source']['use_postgres']

ns = node['sphinxsearch']['source']
cache_dir = Chef::Config[:file_cache_path]
build_dir = File.join(cache_dir, "sphinx-#{ns['version']}")

remote_file File.join(cache_dir, ns['archive']) do
  source ns['url']
  checksum ns['checksum']
  action :create_if_missing
end

execute "extract-sphinxsearch" do
  cwd cache_dir
  command "tar -zxvf #{File.join(cache_dir, ns['archive'])}"
  not_if { ::File.directory?(build_dir) }
end

remote_file File.join(cache_dir, ns['stemmer_archive']) do
  source ns['stemmer_url']
  checksum ns['stemmer_checksum']
  action :create_if_missing
  only_if { ns['use_stemmer'] }
end

execute "extract-libstemmer" do
  cwd cache_dir
  command "tar -C #{build_dir} -zxvf #{File.join(cache_dir, ns['stemmer_archive'])}"
  not_if { ::File.exists?(File.join(build_dir, 'libstemmer_c', 'src_c')) }
  only_if { ns['use_stemmer'] }
end

configure_flags = [
  "--prefix=#{ns['install_path']}",
  ns['use_stemmer'] ? '--with-stemmer' : '--without-stemmer',
  ns['use_mysql'] ? '--with-mysql' : '--without-mysql',
  ns['use_postgres'] ? '--with-pgsql' : '--without-pgsql'
]

bash 'build-and-install-sphinxsearch' do
  cwd build_dir
  code "./configure #{configure_flags.join(' ')} && make && make install"
  not_if { ::File.exists?(File.join(ns['install_path'], 'bin', 'searchd')) }
end
