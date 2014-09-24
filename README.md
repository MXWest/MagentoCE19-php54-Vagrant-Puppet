# Magento CE 1.9.0.1 Php 5.4 Vagrant Puppet 

Installs Magento CE 1.9.0.1, on php 5.4.
Running on Debian 7.5 “Wheezy” Distro vagrant box.

- MySQL root password => 'root'
- Database Username => 'magento'
- Database Password => 'magento'
- Magento Admin user => 'admin'
- Magento Admin Password => 'testing123'

Magento URL: http://magento.localhost:8080/magento/
Magento Admin URL: http://magento.localhost:8080/magento/index.php/admin/

To make these URLs work, point magento.localhost at ... your localhost. Something like
this in your etc/hosts file should do it:
```
127.0.0.1	localhost magento.localhost 
```
