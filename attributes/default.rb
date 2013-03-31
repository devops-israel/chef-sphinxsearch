default['sphinxsearch']['install_method'] = 'package'

# when installing packages in RHEL/CENTOS include yum::epel by default
# set to 'nil' to not include recipes before installing the sphinx package
default['sphinxsearch']['yum_repo_include'] = 'yum::epel'
