ITK Development Environment
===========================
A repository of scripts to set up an ITK development environment
----------------------------------------------------------------

These scripts will download and build ITK and SimpleITK to create an ITK
development on your local box, in a local virtual machine, or on a
virtual machine in the cloud.

VirtualBox Virtual Machine
--------------------------

1. Install Vagrant_
#. Install `Salty Vagrant`_  (``vagrant gem install vagrant-salt``)
#. Download a base linux box from `VagrantBox.es`_ (``vagrant box add DebianSqueeze32 http://mathie-vagrant-boxes.s3.amazonaws.com/debian_squeeze_32.box``)
#. 
#. Run ``vagrant up``

.. _Vagrant: http://www.vagrantup.com/
.. _Salty Vagrant: https://github.com/saltstack/salty-vagrant
.. _VagrantBox.es: http://www.vagrantbox.es/
