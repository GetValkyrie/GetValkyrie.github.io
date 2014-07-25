EC2 IAM
=======

To start, we create an AWS IAM user, so that we use credentials with limited
access to our AWS account. We then have to create a group with access to
perform operations on our AWS EC2 account, and add the new user.

Take note of the 'access_key_id' and the 'secret_access_key', as we'll need to
use them in the ref:`Vagrant-AWS-label` setup.

