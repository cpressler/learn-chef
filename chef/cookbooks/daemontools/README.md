# daemontools

TODO: Enter the cookbook description here.

Files changed

lrwxrwxrwx.  1 root root  15 Feb 27 18:01 envdir -> /command/envdir
lrwxrwxrwx.  1 root root  18 Feb 27 18:01 envuidgid -> /command/envuidgid
lrwxrwxrwx.  1 root root  15 Feb 27 18:01 fghack -> /command/fghack
lrwxrwxrwx.  1 root root  17 Feb 27 18:01 multilog -> /command/multilog
lrwxrwxrwx.  1 root root  17 Feb 27 18:01 pgrphack -> /command/pgrphack
lrwxrwxrwx.  1 root root  22 Feb 27 18:01 readproctitle -> /command/readproctitle
lrwxrwxrwx.  1 root root  16 Feb 27 18:01 setlock -> /command/setlock
lrwxrwxrwx.  1 root root  18 Feb 27 18:01 setuidgid -> /command/setuidgid
lrwxrwxrwx.  1 root root  18 Feb 27 18:01 softlimit -> /command/softlimit
lrwxrwxrwx.  1 root root  18 Feb 27 18:01 supervise -> /command/supervise
lrwxrwxrwx.  1 root root  12 Feb 27 18:01 svc -> /command/svc
lrwxrwxrwx.  1 root root  13 Feb 27 18:01 svok -> /command/svok
lrwxrwxrwx.  1 root root  15 Feb 27 18:01 svscan -> /command/svscan
lrwxrwxrwx.  1 root root  19 Feb 27 18:01 svscanboot -> /command/svscanboot
lrwxrwxrwx.  1 root root  15 Feb 27 18:01 svstat -> /command/svstat
lrwxrwxrwx.  1 root root  15 Feb 27 18:01 tai64n -> /command/tai64n
lrwxrwxrwx.  1 root root  20 Feb 27 18:01 tai64nlocal -> /command/tai64nlocal

lrwxrwxrwx.  1 root root  41 Feb 27 18:01 envdir -> /package/admin/daemontools/command/envdir
lrwxrwxrwx.  1 root root  44 Feb 27 18:01 envuidgid -> /package/admin/daemontools/command/envuidgid
lrwxrwxrwx.  1 root root  41 Feb 27 18:01 fghack -> /package/admin/daemontools/command/fghack
lrwxrwxrwx.  1 root root  43 Feb 27 18:01 multilog -> /package/admin/daemontools/command/multilog
lrwxrwxrwx.  1 root root  43 Feb 27 18:01 pgrphack -> /package/admin/daemontools/command/pgrphack
lrwxrwxrwx.  1 root root  48 Feb 27 18:01 readproctitle -> /package/admin/daemontools/command/readproctitle
lrwxrwxrwx.  1 root root  42 Feb 27 18:01 setlock -> /package/admin/daemontools/command/setlock
lrwxrwxrwx.  1 root root  44 Feb 27 18:01 setuidgid -> /package/admin/daemontools/command/setuidgid
lrwxrwxrwx.  1 root root  44 Feb 27 18:01 softlimit -> /package/admin/daemontools/command/softlimit
lrwxrwxrwx.  1 root root  44 Feb 27 18:01 supervise -> /package/admin/daemontools/command/supervise
lrwxrwxrwx.  1 root root  38 Feb 27 18:01 svc -> /package/admin/daemontools/command/svc
lrwxrwxrwx.  1 root root  39 Feb 27 18:01 svok -> /package/admin/daemontools/command/svok
lrwxrwxrwx.  1 root root  41 Feb 27 18:01 svscan -> /package/admin/daemontools/command/svscan
lrwxrwxrwx.  1 root root  45 Feb 27 18:01 svscanboot -> /package/admin/daemontools/command/svscanboot
lrwxrwxrwx.  1 root root  41 Feb 27 18:01 svstat -> /package/admin/daemontools/command/svstat
lrwxrwxrwx.  1 root root  41 Feb 27 18:01 tai64n -> /package/admin/daemontools/command/tai64n
lrwxrwxrwx.  1 root root  46 Feb 27 18:01 tai64nlocal -> /package/admin/daemontools/command/tai64nlocal

/package/admin/daemontools/command

-rwxr-xr-x. 1 root root 18800 Feb 27 18:01 envdir
-rwxr-xr-x. 1 root root 18736 Feb 27 18:01 envuidgid
-rwxr-xr-x. 1 root root 14704 Feb 27 18:01 fghack
-rwxr-xr-x. 1 root root 27256 Feb 27 18:01 multilog
-rwxr-xr-x. 1 root root 14648 Feb 27 18:01 pgrphack
-rwxr-xr-x. 1 root root  6328 Feb 27 18:01 readproctitle
-rwxr-xr-x. 1 root root 18776 Feb 27 18:01 setlock
-rwxr-xr-x. 1 root root 14680 Feb 27 18:01 setuidgid
-rwxr-xr-x. 1 root root 18776 Feb 27 18:01 softlimit
-rwxr-xr-x. 1 root root 18952 Feb 27 18:01 supervise
-rwxr-xr-x. 1 root root 14696 Feb 27 18:01 svc
-rwxr-xr-x. 1 root root 14632 Feb 27 18:01 svok
-rwxr-xr-x. 1 root root 18832 Feb 27 18:01 svscan
-r-xr-xr-x. 1 root root   740 Feb 27 18:01 svscanboot
-rwxr-xr-x. 1 root root 14728 Feb 27 18:01 svstat
-rwxr-xr-x. 1 root root 10544 Feb 27 18:01 tai64n
-rwxr-xr-x. 1 root root 10608 Feb 27 18:01 tai64nlocal

added
/service

/etc/inittab
SV:123456:respawn:/command/svscanboot