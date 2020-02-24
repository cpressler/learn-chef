# -*- mode: ruby -*-
# vi: set ft=ruby :

$configureServer=<<-SHELL
 yum install -y wget
 yum install -y net-tools
 usermod -a -G wheel vagrant
 cd /tmp
 wget https://packages.chef.io/files/stable/chef-server/13.1.13/el/7/chef-server-core-13.1.13-1.el7.x86_64.rpm
 rpm -ivh chef-server-core-*.rpm
 rm chef-server-core*.rpm
 chef-server-ctl reconfigure  --chef-license=accept
 chef-server-ctl status
 chef-server-ctl user-create admin admin admin admin@itzgeek.local password -f /etc/chef/admin.pem
 chef-server-ctl org-create itzgeek "ITzGeek, Inc" --association_user admin -f /etc/chef/itzgeek-validator.pem
 chef-server-ctl install chef-manage
 chef-server-ctl reconfigure
 chef-manage-ctl reconfigure  --accept-license
 chef-server-ctl install opscode-push-jobs-server
 opscode-push-jobs-server-ctl reconfigure
# chef-server-ctl install opscode-reporting
# opscode-reporting-ctl reconfigure  --accept-license

# firewall-cmd --permanent --zone public --add-service http
# firewall-cmd --permanent --zone public --add-service https
# firewall-cmd --reload

SHELL

$configureClient=<<-SHELL
 yum install -y wget
 yum install -y net-tools
 cd /tmp
 wget https://packages.chef.io/files/stable/chef/15.8.23/el/7/chef-15.8.23-1.el7.x86_64.rpm
 rpm -ivh chef*.rpm
 rm chef*.rpm

SHELL

Vagrant.configure(2) do |config|
# centos defaults to 40GB
#  config.disksize.size = '10GB'
  config.vm.define "chefserver" do |server|
    server.vm.box = "centos/7"
    server.vm.network "public_network" , bridge: "em1"

     server.vm.host_name = "chefserver"
     server.ssh.insert_key = false
     server.vm.provision "shell", inline: $configureServer

     server.vm.provider "virtualbox" do |v|
       v.customize ["modifyvm", :id, "--groups", "/chefsys"]
       v.customize ["modifyvm", :id, "--ostype", "CentOS"]
       v.cpus = 1
       v.memory = 3512
#       v.name = "chefserver"
     end
  end

  config.vm.define "chefclient" do |client|
    client.vm.box = "centos/7"
    client.vm.network "public_network" , bridge: "em1"

     client.vm.host_name = "chefclient"
     client.ssh.insert_key = false
     client.vm.provision "shell", inline: $configureClient

     client.vm.provider "virtualbox" do |v|
       v.customize ["modifyvm", :id, "--groups", "/chefsys"]
       v.customize ["modifyvm", :id, "--ostype", "CentOS"]
       v.cpus = 1
       v.memory = 512
#       v.name = "chefclient"
     end
  end

end
