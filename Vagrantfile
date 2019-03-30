# -*- mode: ruby -*-

PUBLIC_NETWORK_INTERFACE = "en4: Thunderbolt Ethernet"
HOST = "192.168.1.150"

Vagrant.configure("2") do |config|
  config.vm.box = "centos7-1810"

  config.vm.hostname = "virtualbox-centos7"
  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.network "public_network", bridge: + PUBLIC_NETWORK_INTERFACE
  config.ssh.host = HOST

  # Custom account.
  config.ssh.username = "root"
  config.ssh.password = "3qaz!QAZ"

  # For support the ansible provision.
  config.ssh.insert_key = true

  # provision
  ###########

  # 1. Provision via VBoxManage cli.
  config.vm.provider :virtualbox do |v|
    v.linked_clone = true
    #v.gui = true
    v.cpus = 2
    v.memory = 2048
    v.customize ["modifyvm", :id, "--usb", "off"]
    v.customize ["modifyvm", :id, "--audio", "none"]

    # Network.
    v.customize ["modifyvm", :id, "--nic1", "bridged"]
    v.customize ["modifyvm", :id, "--nictype1", "82540EM"]
    v.customize ["modifyvm", :id, "--cableconnected1", "on"]
    v.customize ["modifyvm", :id, "--nictrace1", "off"]
    v.customize ["modifyvm", :id, "--bridgeadapter1", + PUBLIC_NETWORK_INTERFACE]
    v.customize ["modifyvm", :id, "--macaddress1", "auto"]
  end

  # 2. Provision via shell.
  config.vm.provision "shell", inline: "echo Hello, World"

  # 3. Provision via Ansible Playbook.
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "./demo.yml"
    ansible.become = true
  end
end

# vi: set ft=ruby :
