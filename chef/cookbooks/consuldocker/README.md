# consuldocker

Installs consul to run under docker

1) docker is installed
2) docker compose is installed
3) consul is install

### Notes

This recipe is setup to have a dependency on another recipe "dockerfull" which will get installed first
since we cannot run a docker-compose file unless that is already installed.


## Testing

### manual test kitchen
```bash

$ kitchen login
Add user vagrant to docker group so it can run the docker executable
[vagrant@default-centos-7 ~]$ sudo usermod -aG docker $USER 
[vagrant@default-centos-7 ~]$ groups
vagrant
Need to logout and then back in for group change to take effect
[vagrant@default-centos-7 ~]$ exit
$ kitchen login
[vagrant@default-centos-7 ~]$ 
now the docker group should be added 
[vagrant@default-centos-7 ~]$ groups
vagrant docker

Testing consul alive with a curl command
[vagrant@default-centos-7 ~]$ curl -v localhost:8500/ui/

* About to connect() to localhost port 8500 (#0)
*   Trying ::1...
* Connected to localhost (::1) port 8500 (#0)
> GET /ui/ HTTP/1.1
> User-Agent: curl/7.29.0
> Host: localhost:8500
> Accept: */*
>
< HTTP/1.1 200 OK
.......

```


