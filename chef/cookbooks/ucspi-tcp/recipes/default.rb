#
# Cookbook:: ucspi-tcp
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

['curl','gcc','make', 'rsync'].each do |pkg|
   package pkg do
      action :install
   end
end

script "install ucspi-tcp" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    #insert bash script
#    yum -y install curl gcc make rsync
    if [ ! -d "/root/dns" ]
    then
        echo "Setting up directory /root/dns for install download"
        mkdir -p /root/dns
    fi

    cd /root/dns
    curl -O http://cr.yp.to/ucspi-tcp/ucspi-tcp-0.88.tar.gz
    tar -xzf ucspi-tcp-0.88.tar.gz

    cd /root/dns/ucspi-tcp-0.88
    echo gcc -O2 -include /usr/include/errno.h > conf-cc
    make setup check

    cd /root
#    rm -rf dns
  EOH
end