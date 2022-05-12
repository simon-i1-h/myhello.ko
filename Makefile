# SPDX-License-Identifier: MIT

.PHONY: all vagrant-all clean vagrant-clean vagrant-setup destroy

KDIR = /lib/modules/$(shell uname -r)/build
SRCS = myhello.c

vagrant-all: vagrant-setup
	vagrant ssh -c 'cd /home/vagrant/myhello.ko && make all'

all: $(SRCS)
	make -C $(KDIR) M=$$PWD

vagrant-clean: vagrant-setup
	vagrant ssh -c 'cd /home/vagrant/myhello.ko && make clean'

clean:
	make -C $(KDIR) M=$$PWD clean

vagrant-setup:
	vagrant up
	vagrant rsync

destroy:
	vagrant halt
	vagrant destroy
	rm -rf vagrant_data .vagrant
