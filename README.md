# vagrant-hadoop-hive-single-node

This project is for running Apache Hadoop and Hive in a single node mode on Vargrant virtual machine. If you want to learn Hive it can be useful to be able to practice.

## It installs and sets up the followings on ubuntu/trusty64 Vagrant box
* Java: openjdk-7-jdk
* Haddop: hadoop-2.7.1
* Hive: apache-hive-1.2.1

_It is tested on Virtualbox yet._

## Prerequisites
* Virtualbox (https://www.virtualbox.org)
* Vagrant (more information: https://www.vagrantup.com)

## Run Vagrant
* navigate into the project directory
* type "**vagrant up**" in terminal (be patient, it will take several minutes)
* type "**vagrant ssh**", you will logged into the virtual machine

For stopping the Vagrant box see more here: http://docs.vagrantup.com/v2/getting-started/teardown.html

## Run Hive
* type "**hive**"

## Use Haddop
Of course you can use Hadoop as well in single node. E.g. type: "hadoop fs -ls" 
