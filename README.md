## Rails Vagrant Initialisation Script

This will install a lot of things automatically:

1. Ubuntu Trusty 32-bit
2. Install SQLite
3. Install memcached
4. Install Redis
5. Install postgresql
6. Install MySQL
7. Install Ruby 2.3
8. Install NodeJS
9. Install Rails and a lot, a lot of dependencies

To setup the box, clone this repository, and `cd` to the cloned folder.
Execute:

```
vagrant up
```

After all installation done, on the same root folder of the cloned repo,
execute:

```
vagrant ssh
```

Now you are set, you are in the guest machine's shell.

FYI, the localhost of guest machine is set to 3000 which will connect to port 3000
on the host.
