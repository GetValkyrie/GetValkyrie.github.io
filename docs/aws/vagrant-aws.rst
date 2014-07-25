.. _Vagrant-AWS-label:

Vagrant AWS
-----------

To automate building and managing EC2 instances (see: :ref:`AWS-EC2-label`), we
use Vagrant with the vagrant-aws_ plugin. Installing this plugin is as easy
as::

    $ vagrant plugin install vagrant-aws

You can check that it was properly installed, and the current version of the
plugin like so::

    $ vagrant plugin list
    vagrant-aws (0.5.0)
    ...

.. _vagrant-aws: http://rubydoc.info/gems/vagrant-aws/0.5.0/frames


Vagrantfile configs
-------------------

To configure Vagrant to use our AWS account, we need to provide the IAM
credentials that we generated earlier::

  aws.access_key_id = <KEY_ID>
  aws.secret_access_key = <SECRET_KEY_ID>

In order for Vagrant to connect to the EC2 instance (for provisioning, SSH,
etc.) we need to provide an SSH keypair. In the Vagrant AWS configs, we can
specify the 'keypair_name' that we generate above. We also need to override
Vagrant's default SSH user and key::

    ssh.username = "ubuntu"
    ssh.private_key_path = "path/to/downloaded/keypair.pem"

Finally, we need to add one or more 'tags'::

    aws.tags = {
      'type' => 'Jenkins',
      'Name' => 'ci.getvalkyrie.com',
    }

To provision the server, we now run::

    $ vagrant up --provider=aws

