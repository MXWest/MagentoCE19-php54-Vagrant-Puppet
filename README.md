# Archived 16-September-2022
This is ancient. So let's archive it, eh?

# Magento CE 1.9.0.1 Php 5.4 Vagrant Puppet 

Installs Magento CE 1.9.0.1, on php 5.4.
Running on Debian 7.5 “Wheezy” Distro vagrant box.

- MySQL root password => 'root'
- Database Username => 'magento'
- Database Password => 'magento'
- Magento Admin user => 'admin'
- Magento Admin Password => 'testing123'

```
Magento URL: http://magento.localhost:8080/magento/
Magento Admin URL: http://magento.localhost:8080/magento/index.php/admin/
```

To make these URLs work, point magento.localhost at ... your localhost. Something like
this in your etc/hosts file should do it:

```
127.0.0.1	localhost magento.localhost 
```

## Prerequisites
* VirtualBox (I used 4.3.16 r95972 to put this together)
* Vagrant (I used 1.6.5 to put this together)

# XDebug Support

Xdebug is enabled and running.

## NetBeans
I first used NetBeans for Magento debugging because it was free and it worked. I continue to do so because it's free and it works.

This setup worked in my environment, which is:

* OS X 10.9.5 (13F34)
* VirtualBox 4.3.16 r95972
* NetBeans IDE 8.0 (Build 201403101706)
* Vagrant 1.6.5

### NetBeans Setup

Asuming you're setup - as you should be - such that your vagrant box is serving Magento at http://magento.localhost:8080/magento/, you should be able to configure NetBeans to get debugging to work:

* **Create your project** as _PHP Application with Existing Sources_
* **Project Source folder** is the magento directory in your vagrant shared directory (```/PATH_TO_YOUR_VAGRANT/data/magento```)
* **Run As:**  _Local Web Site (running on local web server)_
* **Project URL:** _http://magento.localhost:8080/magento/_
* **Add path mapping** (```Project Properties->Run Configuration->Advanced```) to map the shared directory: ``` Server Path: /vagrant/ => Project Path: /PATH_TO_YOUR_VAGRANT/data/ ```


# Acknowledgement

This project was originally forked from work done by Christian Münch at https://github.com/cmuench. Specifically it was based on Christian's Magento Vagrant Puppet (https://github.com/cmuench/Magento-Vagrant-Puppet). As there didn't appear to be much activity on it lately, I decided just to roll my own repo on this one.

