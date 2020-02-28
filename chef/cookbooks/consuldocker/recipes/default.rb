#
# Cookbook:: consuldocker
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute 'docker_version' do
  command 'docker --version'
end

execute 'docker_version' do
  command '/usr/local/bin/docker-compose --version'
end


script "make deploy directory" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  mkdir -p /deploy
  mkdir -p /deploy/consul
  EOH
end

cookbook_file '/deploy/consul/docker-compose.yml' do
  source 'docker-compose.yml'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

script "install docker consul" do
  interpreter "bash"
  user "root"
  cwd "/deploy/consul"
  code <<-EOH
    # install packages needed above then run this
    ls -al
   /usr/local/bin/docker-compose  -p "consulS" -f docker-compose.yml down
   /usr/local/bin/docker-compose  -p "consulS" -f docker-compose.yml up -d
  EOH
end

