#
# Cookbook:: tinydns
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

['curl','gcc','make', 'rsync'].each do |pkg|
   package pkg do
      action :install
   end
end


script "install tinydns" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    #bash script
    mkdir -p /root/dns
    cd /root/dns

    curl -O http://cr.yp.to/djbdns/djbdns-1.05.tar.gz
    tar -xzf djbdns-1.05.tar.gz
    cd /root/dns/djbdns-1.05
    echo gcc -O2 -include /usr/include/errno.h > conf-cc
    make setup check

    adduser tinydns
    useradd -d /var/dnscache -s /bin/false dnscache
    useradd -d /var/dnscache -s /bin/false dnslog

    dnscache-conf dnscache dnslog /var/dnscache/dnscache   192.168.20.1
    touch /var/dnscache/dnscache/root/ip/192.168
    ln -sf /var/dnscache/dnscache /service/

    useradd -d /var/dnscache -s /bin/false tinydns
    useradd -d /var/dnscache -s /bin/false tinylog

    tinydns-conf tinydns tinylog /var/dnscache/tinydns 127.0.0.1

    ln -sf /var/dnscache/tinydns /service

 #   tinydns-conf tinydns tinylog /usr/local/tinydns-nsN IP
 #   axfrdns-conf tinydns tinylog /usr/local/axfrdns-nsN /usr/local/tinydns-nsN IP
  EOH
end