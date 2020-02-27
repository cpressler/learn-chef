# docker

This will install the following on a CentOS machine.

1) docker YUM repos
2) docker 
3) docker-compose



#### Test kitchen
Running this in Test kitchen to test

```bash

$ kitchen list
Instance          Driver   Provisioner  Verifier  Transport  Last Action    Last Error
default-centos-7  Vagrant  ChefZero     Inspec    Ssh        <Not Created>  <None>

$ kitchen create

-----> Starting Test Kitchen (v2.3.4)
-----> Creating <default-centos-7>...
       Bringing machine 'default' up with 'virtualbox' provider...
       ==> default: Checking if box 'bento/centos-7' version '202002.04.0' is up to date...
       ==> default: Machine not provisioned because `--no-provision` is specified.
       [SSH] Established
       Vagrant instance <default-centos-7> created.
       Finished creating <default-centos-7>


$ kitchen list
Instance          Driver   Provisioner  Verifier  Transport  Last Action  Last Error
default-centos-7  Vagrant  ChefZero     Inspec    Ssh        Created      <None>


$ kitchen converge


-----> Starting Test Kitchen (v2.3.4)
-----> Converging <default-centos-7>...
       Preparing files for transfer
$$$$$$ You must set your run_list in your Policyfile instead of kitchen config. The run_list in your config will be ignored.
$$$$$$ Ignored run_list: ["recipe[docker::default]"]
       Installing cookbooks for Policyfile /Users/chesterpressler/development/learn-chef/chef/cookbooks/docker/Policyfile.rb using `chef install`
       Installing cookbooks from lock
       Installing docker 0.1.0
       Preparing dna.json
       Exporting cookbook dependencies from Policyfile /var/folders/f_/5bp5swln24900_7hkb5cnzkc0000gp/T/default-centos-7-sandbox-20200225-1874-il96xf...
       Exported policy 'docker' to /var/folders/f_/5bp5swln24900_7hkb5cnzkc0000gp/T/default-centos-7-sandbox-20200225-1874-il96xf

       To converge this system with the exported policy, run:
         cd /var/folders/f_/5bp5swln24900_7hkb5cnzkc0000gp/T/default-centos-7-sandbox-20200225-1874-il96xf
         chef-client -z
       Removing non-cookbook files before transfer
       Preparing validation.pem
       Preparing client.rb
-----> Chef installation detected (install only if missing)
       Transferring files to <default-centos-7>
       Starting Chef Infra Client, version 15.8.23
       Using policy 'docker' at revision 'cf503efa521f6a07152635345a64a64e2a93ab934a49033942bd8a60bcd6682c'
       resolving cookbooks for run list: ["docker::default@0.1.0 (4feab64)"]
       Synchronizing Cookbooks:
         - docker (0.1.0)
       Installing Cookbook Gems:
       Compiling Cookbooks...
       Converging 9 resources
       Recipe: docker::default
         * yum_package[yum-utils] action install (up to date)
         * yum_package[device-mapper-persistent-data] action install (up to date)
         * yum_package[lvm2] action install (up to date)
         * remote_file[/etc/yum.repos.d/docker-ce.repo] action create (up to date)
         * yum_package[docker-ce] action install
           - install version 3:19.03.6-3.el7.x86_64 of package docker-ce
         * service[docker] action enable
           - enable service service[docker]
         * service[docker] action start
           - start service service[docker]
         * execute[docker_version] action run
           - execute docker --version
         * execute[docker_compose_download] action run
           - execute curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
         * file[/usr/local/bin/docker-compose] action create
           - change mode from '0644' to '0755'
           - restore selinux security context

       Running handlers:
       Running handlers complete
       Chef Infra Client finished, 6/10 resources updated in 50 seconds
       Downloading files from <default-centos-7>
       Finished converging <default-centos-7> (0m57.65s).
-----> Test Kitchen is finished. (0m59.43s)

```

##### references

https://linuxacademy.com/blog/tutorials/testing-chef-cookbooks-with-kitchen-and-docker/


