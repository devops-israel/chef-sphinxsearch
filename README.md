sphinxsearch Cookbook
=====================

This cookbook installs Sphinx, the open-source search server, available from
[sphinxsearch.com](http://sphinxsearch.com). This cookbook allows to install sphinx from a package or
compile it from source, optionally with libstemmer and mysql/postgresql.


Requirements
------------

Tested on Ubuntu 10.04/12.04 and CentOS 6.3.

#### packages

- `build-essentials` - required to compile sphinx from source
- `mysql` - required for `sphinxsearch::source` when `use_mysql=true`
- `postgresql` - required for `sphinxsearch::source` when `use_postgres=true`
- `yum` - required for `sphinxsearch::package` on RHEL unless `yum_repo_include=nil`


Attributes
----------

#### sphinxsearch::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>sphinxsearch/install_method</tt></td>
    <td>String</td>
    <td>install from `package` or compile from `source`</td>
    <td><tt>package</tt></td>
  </tr>
  <tr>
    <td><tt>sphinxsearch/yum_repo_include</tt></td>
    <td>String or Nil</td>
    <td>include_recipe for a yum repository before installing the package, use `nil` to not include any recipes</td>
    <td><tt>yum::epel</tt></td>
  </tr>
</table>

#### sphinxsearch::source

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>sphinxsearch/source/version</tt></td>
    <td>String</td>
    <td>sphinx version</td>
    <td><tt>2.0.7-release</tt></td>
  </tr>
  <tr>
    <td><tt>sphinxsearch/source/install_path</tt></td>
    <td>String</td>
    <td>installation prefix</td>
    <td><tt>/opt/sphinxsearch-{version}</tt></td>
  </tr>
  <tr>
    <td><tt>sphinxsearch/source/archive</tt></td>
    <td>String</td>
    <td>name of tarball to download</td>
    <td><tt>sphinx-{version}.tar.gz</tt></td>
  </tr>
  <tr>
    <td><tt>sphinxsearch/source/checksum</tt></td>
    <td>String</td>
    <td>checksum of tarball</td>
    <td><tt>{checksum}</tt></td>
  </tr>
  <tr>
    <td><tt>sphinxsearch/source/url</tt></td>
    <td>String</td>
    <td>url to download tarball from</td>
    <td><tt>http://sphinxsearch.com/files/{archive}</tt></td>
  </tr>
  <tr>
    <td><tt>sphinxsearch/source/stemmer_archive</tt></td>
    <td>String</td>
    <td>name of libstemmer tarball</td>
    <td><tt>libstemmer_c.tgz</tt></td>
  </tr>
  <tr>
    <td><tt>sphinxsearch/source/stemmer_checksum</tt></td>
    <td>String</td>
    <td>checksum of libstemmer tarball</td>
    <td><tt>{checksum}</tt></td>
  </tr>
  <tr>
    <td><tt>sphinxsearch/source/stemmer_url</tt></td>
    <td>String</td>
    <td>url to download libstemmer tarball</td>
    <td><tt>http://snowball.tartarus.org/dist/{stemmer_archive}</tt></td>
  </tr>
  <tr>
    <td><tt>sphinxsearch/source/use_mysql</tt></td>
    <td>Boolean</td>
    <td>compile sphinx with mysql (requires mysql cookbook)</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>sphinxsearch/source/use_postgres</tt></td>
    <td>Boolean</td>
    <td>compile sphinx with postgresql (requires postgresql cookbook)</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>sphinxsearch/source/use_stemmer</tt></td>
    <td>Boolean</td>
    <td>compile sphinx with libstemmer</td>
    <td><tt>false</tt></td>
  </tr>
</table>

Usage
-----

#### sphinxsearch::default

Just include `sphinxsearch` in your node's `run_list`, optionally change
attributes:

```json
{
  "name":"my_node",
  "normal": {
    "sphinxsearch": {
        "install_method": "source"
    }
  },
  "run_list": [
    "recipe[sphinxsearch]"
  ]
}
```

Contributing
------------
This cookbook is still a work in progress, you are welcome to help by
contributing fixes, documentation and tests.

e.g.

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
### License

See [LICENSE](LICENSE) for full details.

##### Authors:

 - Evgeny Zislis <evgeny@devops.co.il>
