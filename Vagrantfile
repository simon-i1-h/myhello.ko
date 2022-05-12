# SPDX-License-Identifier: MIT
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-20.04"

  config.vm.synced_folder "vagrant_data", "/vagrant_data", create: true
  config.vm.synced_folder ".", "/home/vagrant/myhello.ko", type: "rsync",
                          rsync__exclude: ["vagrant_data", ".git"]

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = "4096"
  end

  config.vm.provision "shell", inline: <<-SHELL
    set -eu
    apt-get update
    apt-get install -y build-essential kmod linux-headers-$(uname -r)
  SHELL
end
