name             'sphinxsearch'
maintainer       'Devops Israel'
maintainer_email 'evgeny@devops.co.il'
license          'BSD'
description      'Installs/Configures sphinxsearch'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

# required for sphinxsearch::source
suggests "build-essential"
suggests "mysql"
suggests "postgresql"
