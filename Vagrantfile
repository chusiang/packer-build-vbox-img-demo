# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # VirtualBox.
  config.vm.define "virtualbox" do |virtualbox|
    virtualbox.vm.hostname = "virtualbox-centos7"
    virtualbox.vm.box = "packer-demo"
    virtualbox.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
    virtualbox.vm.synced_folder '.', '/vagrant', disabled: true
    config.ssh.host = "10.0.0.150"
    config.ssh.username = "root"
    config.ssh.password = '1qaz!QAZ'
    config.vm.provision "shell", inline: "echo Hello, World"

    config.ssh.insert_key = false

    config.vm.provision :ansible do |ansible|
      ansible.limit = "all"
      ansible.playbook = "./ansible/demo.yml"
      ansible.host_key_checking = "false"
      ansible.force_remote_user = "root"
    end

    config.vm.provider :virtualbox do |v|
      v.gui = true
      v.cpus = 1
      v.memory = 1024
      v.customize ["modifyvm", :id, "--nic1", "bridged"]
      v.customize ["modifyvm", :id, "--nictype1", "82540EM"]
      v.customize ["modifyvm", :id, "--cableconnected1", "on"]
      v.customize ["modifyvm", :id, "--nictrace1", "off"]
      v.customize ["modifyvm", :id, "--bridgeadapter1", "en1: Wi-Fi (AirPort)"]
      v.customize ["modifyvm", :id, "--macaddress1", "auto"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--audio", "none"]
    end

  end

end

