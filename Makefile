# Parser each playbooks with `*.yml`, and no include the `requirements.yml`.
PLAYBOOKS = $(shell ls *.yml | sed '/requirements.yml/d;/requirements_dev.yml/d')

main: check

# ---- Initialization ----------------------------------------------------------

init: add_box

add_box:
	vagrant box add output/centos7-1810-CentOS-7-1810-x86_64-minimal.box --name centos7-1810

# ---- Check -------------------------------------------------------------------

check: check_packer check_ansible check_ansible_lint

check_packer:
	packer validate centos7-1810-root.json

check_playbook:
	ansible-playbook --syntax-check $(PLAYBOOKS)

check_ansible_lint:
	ansible-lint $(PLAYBOOKS)

# ---- Build -------------------------------------------------------------------

build: build_packer

build_packer:
	time PACKER_LOG=1 packer build centos7-1810-root.json

# ---- Clean -------------------------------------------------------------------

clean:
	-rm -f *.retry
	-vagrant destroy -f

clean_box:
	vagrant box remove -f centos7-1810
