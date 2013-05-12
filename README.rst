ITK Development Environment
===========================
A repository of scripts to set up an ITK development environment
----------------------------------------------------------------

These scripts will download and build ITK and SimpleITK to create an ITK
development on your local box, in a local virtual machine, or on a
virtual machine in the cloud.

VirtualBox Virtual Machine
--------------------------

1. Install VirtualBox_
#. Install Vagrant_
#. Install `Salty Vagrant`_  (``vagrant plugin install vagrant-salt``)
#. Download a base linux box from the `ITK Midas Community`_ or `VagrantBox.es`_ (``vagrant box add DebianWheezy32 http://midas3.kitware.com/midas/download/bitstream/324020/wheezy32.box``)
#. Go to the *Vagrant* directory of this repository (``cd Vagrant``)
#. Run ``vagrant up``

Debian Wheezy in the Cloud
---------------------------

1. `Install salt`_.
#. ``aptitude install git``
#. ``git clone https://github.com/InsightSoftwareConsortium/ITKDevelopmentEnvironment``
#. ``mkdir -p /srv && cd /srv``
#. ``ln -s ~/ITKDevelopmentEnvironment/Salt/salt``
#. ``salt-call --local state.highstate``

.. _VirtualBox: https://www.virtualbox.org/
.. _Vagrant: http://www.vagrantup.com/
.. _Salty Vagrant: https://github.com/saltstack/salty-vagrant
.. _VagrantBox.es: http://www.vagrantbox.es/
.. _Install salt: http://docs.saltstack.com/topics/installation/debian.html
.. _ITK Midas Community: http://midas3.kitware.com/midas/community/12
