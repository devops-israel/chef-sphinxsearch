name             'sphinxsearch'
maintainer       'Devops Israel'
maintainer_email 'evgeny@devops.co.il'
license          'BSD'
description      'Installs/Configures sphinxsearch'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

# required for sphinxsearch::source
depends "build-essential"
depends "mysql"
depends "postgresql"
