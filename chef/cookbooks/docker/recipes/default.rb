#
# Cookbook:: docker
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.



#yum-utils device-mapper-persistent-data lvm2
#package ['yum-utils','device-mapper-persistent-data','lvm2']
#	action  :install
#end

#%w{yum-utils device-mapper-persistent-data lvm2 }.each do |pkg|
['yum-utils','device-mapper-persistent-data','lvm2'].each do |pkg|
#['device-mapper-persistent-data','lvm2'].each do |pkg|
   package pkg do
      action :install
   end
end

remote_file '/etc/yum.repos.d/docker-ce.repo' do
  source 'https://download.docker.com/linux/centos/docker-ce.repo'
  use_last_modified false # true by default
  owner 'root'
  group 'root'
  mode '755'
end

package 'docker-ce' do
   action :install
end

#yum_repository 'docker-ce' do
#  action :add
#  enabled false
#end

service 'docker' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end


execute 'docker_version' do
  command 'docker --version'
end

execute 'docker_compose_download' do
  command 'curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'
end

file '/usr/local/bin/docker-compose' do
  mode '0755'
end


