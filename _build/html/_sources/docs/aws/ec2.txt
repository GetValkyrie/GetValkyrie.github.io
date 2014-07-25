.. _AWS-EC2-label:

AWS EC2
=======

We use AWS EC2 as our principle production cloud environment.

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
downloaded the private key, as we'll need to use these in the
ref:`Vagrant-AWS-label` setup.


.. _EC2-AMIs-label:

EC2 AMIs
--------

We'll use the latest 64-bit Ubuntu (14.04 LTS) AMI so as to have a Debian-based
system with all the latest packages available. Normally we'd prefer to use the
para-virtualized AMI (ami-7cd51214), since it offers better performance.

However, we may prefer to stick with t2.micro instances, as they fall within
'free tier'. Unfortunately, only HVM AMIs are available for t2.micro instances,
so we'll need to use that AMI (ami-a6d611ce).

