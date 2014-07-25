Vagrant
=======

Vagrant_ allows us to easily provision full test stacks locally (using
Virtualbox_), or on any supported cloud platform (e.g., :ref:`AWS-EC2-label`)
with a minimum of modification to the general framework.

Furthermore, it allows us to configure servers using a number provisioning
options. While we prefer Puppet_ for production environments, for immutable_
utility servers and prototyping, shell scripts work quite well.


Installation
------------

First, install Vagrant from the upstream ``.deb`` files because the Debian ones
are not up to date enough::

  wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb
  sudo dpkg -i vagrant_1.6.3_x86_64.deb

The latest version may vary of course, since this was written, look at
the `download page`_ for the latest version. You will also need a Virtualbox
install::

  sudo apt-get install virtualbox

If the Debian repos fall too far behind, you can `get the latest version
here`_.


Usage
-----

Vagrant has `helpful documentation`_, explaining `usage in detail`_. The rest of
these docs assume knowledge of these docs.


.. _Vagrant: https://www.vagrantup.com/
.. _Virtualbox: https://www.virtualbox.org/
.. _Puppet: http://puppetlabs.com
.. _immutable: http://martinfowler.com/bliki/ImmutableServer.html
.. _`download page`: http://www.vagrantup.com/downloads.html
.. _`get the latest version here`: https://www.virtualbox.org/wiki/Linux_Downloads
.. _`helpful documentation`: https://docs.vagrantup.com/v2/
.. _`usage in detail`: https://docs.vagrantup.com/v2/cli/index.html
