#
# Cookbook:: daemontools
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# cookbook_file "/tmp/installer.sh" do
#   source "installer.sh"
#   mode 0755
# end

# execute "install daemontools" do
#   command "sh /tmp/installer.sh"
# end

['curl','gcc','make', 'rsync'].each do |pkg|
   package pkg do
      action :install
   end
end

script "install daemontools" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    # install packages needed above then run this

    mkdir -p /root/dns
    cd /root/dns
    curl -O http://cr.yp.to/daemontools/daemontools-0.76.tar.gz

    mkdir -p /package
    chmod 1755 /package
    cd /package
    # move daemon tools admin root to /package
    tar -xzf /root/dns/daemontools-0.76.tar.gz
    cd admin/daemontools-0.76/
    echo gcc -O2 -include /usr/include/errno.h > src/conf-cc
    package/install

  EOH
end
