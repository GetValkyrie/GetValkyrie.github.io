AWS EC2
=======

We use AWS EC2 as our principle production cloud environment.


EC2 IAM
-------

To start, we create an AWS IAM user, so that we use credentials with limited
access to our AWS account. We then have to create a group with access to
perform operations on our AWS EC2 account, and add the new user.

Take note of the 'access_key_id' and the 'secret_access_key', as we'll need to
use them in the Vagrant AWS setup.


EC2 SSH Setup
-------------

We'll need to secure communication between the our local environment, where
Vagrant is running, and our EC2 instances. We do this by generating a key pair
in the AWS console, and downloading the private key.

.. todo::
  According to the API docs, we could also generate a keypair locally, and push
  the public key to AWS, using the CLI tools or the API directly.


We'll also need to allow inbound SSH traffic to the server. We can do this by
setting up a new security group (or editing the default one). We'll need to
specify SSH or a custom port, if we don't want to use 22. We may need to open
additional ports, depending on the nature of the server we're provisioning
(http and https will be common, ICMP for health-monitoring ping traffic,
8080 for Jenkins web UI, etc.)

Take note of the security group and keypair names, and the path to which you
downloaded the private key, as we'll need to use these in the Vagrant AWS
setup.


Vagrant AWS plugin
------------------

To automate building and managing EC2 instances, we use Vagrant with the
vagrant-aws_ plugin. Installing this plugin is as easy as::

    $ vagrant plugin install vagrant-aws

You can check that it was properly installed, and the current version of the
plugin like so::

    $ vagrant plugin list
    vagrant-aws (0.5.0)
    ...

.. _vagrant-aws: http://rubydoc.info/gems/vagrant-aws/0.5.0/frames


.. _EC2-AMIs-label:

EC2 AMIs
--------

We'll use the latest 64-bit Ubuntu (14.04 LTS) AMI so as to have a Debian-based
system with all the latest packages available. Normally we'd prefer to use the
para-virtualized AMI (ami-7cd51214), since it offers better performance.

However, we may prefer to stick with t2.micro instances, as they fall within
'free tier'. Unfortunately, only HVM AMIs are available for t2.micro instances,
so we'll need to use that AMI (ami-a6d611ce).


Vagrantfile configs
-------------------

To configure Vagrant to use our AWS account, we need to provide the IAM creden-
tials ('access_key_id' and 'secret_access_key') that we generated earlier.

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

