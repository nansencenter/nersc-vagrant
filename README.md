Configuration of Nansen-Cloud provisioning with vagrant
=======================================================
All Virtual machines (VMs) use miniconda to install python and various libraries.

Usage
=====
```
git clone https://github.com/nansencenter/nersc-vagrant
cd nersc-vagrant
vagrant up
```
Requires vagrant >= 1.8.4

Virtual machines:
=================
* develop : 192.168.33.10
* course : 192.168.33.11
* testintegration : 192.168.33.12
* condarecipes : 192.168.33.13
* doppler : 192.168.33.14
* thredds : 192.168.33.15

Roles
=====
* conda
 * Setup Ubuntu or CentOS
 * Mount netwrok folders
 * Install minimal conda

* condarecipes
 * Prepare for building packages for conda

* condarecipes32
 * Prepare for building packages for conda for 32bits

* course
 * Clone nansat-lectures
 * Add Jupyter-notebook to crontab

* doppler
 * Doppler specific

* nansat
 * Install Nansat requirements from conda and pip
 * Install Nansat

* nansencloud
 * Install Nansen-Cloud requirements
 * Install Nansen-Cloud

* production
 * Empty

* pyoai
 * Installs moai, pyoai and all requirements
 * Installs apache httpd and mod_wsgi
 * Configures apache with moai and starts httpd

* sample_datasets
 * Download sample data

* testintegration
 * Run end2endtests

* thredds
 * Install TOMCAT and THREDDS
 * Copy THREDDS configuration

* webserver
 * Run webserver on Centos


Shared directories
==================
 * /vagrant/shared -> nersc-vagrant/shared
  * this directory is shared also between virtual machines
  * conda_pkgs: cached conda packages
  * test_data: sample data

 * /vagrant/shared/develop_vm -> nesrc-vagrant/shared/develop_vm
  * this directory is specific for virtual machine
  * nansat
  * nansen-cloud
  * openwind

NB! **You better destroy all your machines before git clone**
