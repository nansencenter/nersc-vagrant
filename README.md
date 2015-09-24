Configuration of Nansen-Cloud provisioning with vagrant
=======================================================


All Virtual machines (VMs) now use miniconda to install python and various libraries.

Roles
=====
* common
 * install system libraries and update
 * install miniconda and update
 * install conda packages (and cache in shared directory)
 * install gdal and dependencies from alevin conda repo
 * install nansat using clone, build, link

* sample_datasets
 * download sample data
 * download MODIS landmask

* develop
 * install openwind
 * install nansen-cloud
 * migrate
 * add sample data to database

* course
 * clone nansat-lectures
 * add jupyter to crontab

* production
 * intentionally left empty (it should be just like develop but with a different version of nansat/nansencloud which is configured in group_vars)

* testintegration
 * run nansat tests
 * run end2end tests
 * run gdalinfo

Groups
======
* all:
 * common

* develop
 * sample_datasets
 * develop

* production
 * sample_datasets
 * develop

* course
 * course

* testintegration
 * sample_datasets
 * develop
 * testintegration
 * course

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

NB! **You have to destroy all your machines before git clone**


