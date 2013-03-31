default['sphinxsearch']['source']['version'] = '2.0.7-release'
default['sphinxsearch']['source']['install_path'] = "/opt/sphinxsearch-#{node['sphinxsearch']['source']['version']}"
default['sphinxsearch']['source']['archive'] = "sphinx-#{node['sphinxsearch']['source']['version']}.tar.gz"
default['sphinxsearch']['source']['checksum'] = '668e7bd00ff30596581ef7a7f0a9bc591746f6a259e19e1346350c5efa857ef6'
default['sphinxsearch']['source']['url'] = "http://sphinxsearch.com/files/#{node['sphinxsearch']['source']['archive']}"
default['sphinxsearch']['source']['stemmer_archive'] = 'libstemmer_c.tgz'
default['sphinxsearch']['source']['stemmer_checksum'] = '3f2f19cf8c89e1280354a895961791f42002647c3351f8c4e772aad22aad2fe5'
default['sphinxsearch']['source']['stemmer_url'] = "http://snowball.tartarus.org/dist/#{node['sphinxsearch']['source']['stemmer_archive']}"

default['sphinxsearch']['source']['use_mysql'] = true
default['sphinxsearch']['source']['use_postgres'] = false
default['sphinxsearch']['source']['use_stemmer'] = false
