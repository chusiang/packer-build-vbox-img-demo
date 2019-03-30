# Demo for Packer build Virtualbox image 101

* Speaker: @zarr12steven
* Event: https://opensuse-tw.kktix.cc/events/b0d06b85
* Date: 2019/03/30
* Presentation: https://ppt.cc/fc3Jsx

## Workflow

![workflow](https://user-images.githubusercontent.com/219066/55280145-5e8e6e00-535c-11e9-9265-3b171ef10d4e.jpg)

## VM Up

1. We need waiting some time for boot the CentOS 7.
1. We need manual input `1qz!QZ` password with `vagrant up` first time, because the Vagrant need insert the ssh key to new VM.

> We can support "provision via Ansible Playbook" after insert the ssh key into new VM.

![Result of vagrant up](https://user-images.githubusercontent.com/219066/55280151-6a7a3000-535c-11e9-84d4-018f8fc03772.gif)
