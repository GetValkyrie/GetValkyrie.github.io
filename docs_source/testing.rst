Continuous Integration
======================

We use Jenkins as the basis of our Continuous Integration system.


Vagrant
-------

We currently use AWS EC2, provisioned using the Vagrant AWS plugin, as our
principle testing platform. We should be able to easily provision full test
stacks locally, or on any other supported cloud platforms with a minimum of
modification to the general framework.

Vagrant allows us to configure servers using a number provisioning options.
While we prefer Puppet_ for production environments, for immutable_ utility
servers and prototyping, shell scripts work quite well.

.. todo::
  Research Ansible, which appears to be quite straight-forward, in comparison
  to Puppet, and is configured using YAML.

.. _Puppet: http://puppetlabs.com
.. _immutable: http://martinfowler.com/bliki/ImmutableServer.html


EC2 AMI
-------

Since we're building test servers, we'll often prefer to stick with t2.micro
instances, as they fall within 'free tier'. Unfortunately, only HVM AMIs are
available for t2.micro instances, so we'll need to use that AMI (ami-a6d611ce).

For further details, see the docs for our :ref:`EC2-AMIs-label`.


Jenkins
-------

We install and configure Jenkins using a shell script. It basically adds the
Jenkins Debian repo and its key, installs the latest Jenkins, along with
jenkins-job-builder. It then disables unused plugins.

.. todo:: install useful plugins
.. todo:: install jenkins-cli
.. todo:: configure jjb
.. todo:: create jjb repo for jobs
.. todo:: manage jenkins users/config directly in repo



