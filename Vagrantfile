# -*- mode: ruby -*-
# vi: set ft=ruby :

# Description: Vagrantfile to create 1 CentOS VM 
# to install Kafka
# Author: taflilou
# Date: 2017-10-30

# Looping for each VM
Vagrant.configure("2") do |config|

 # +---------------------+
 # | Apache Kafka VM |
 # +---------------------+
 config.vm.define "kafkavm" do |kafkavm|
  kafkavm.vm.box = "ubuntu/xenial64"
  kafkavm.vm.hostname = "kafkavm"

  # Disable remote synchronisation of current folder, only add ansible directory
  kafkavm.vm.synced_folder '.', '/vagrant', disabled: true
  kafkavm.vm.synced_folder './kafka_sync', '/kafka'

  # Specify the network interface specifications
  kafkavm.vm.network "public_network", bridge: "wlp3s0"
  kafkavm.vm.network "private_network", ip: "192.168.70.10"
  
  # Specify name, memory and gui for VM
  kafkavm.vm.provider "virtualbox" do |vb|
    vb.name = "kafkavm"
    vb.gui = true
    vb.memory = 2048
  end

  # Provisionning shell and ansible for the VM
  kafkavm.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get upgrade -y
     apt-get install -y vim ansible python python-pip
   SHELL

  # Run ansible provisionning script to install Kafka
  kafkavm.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "./ansible/inventory.yml"
    ansible.playbook = "./ansible/playbook.yml"
  end

end

end
