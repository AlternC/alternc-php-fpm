### Packaging ###

You can compile this package with:

```
    apt install build-essential debhelper git
    git clone https://github.com/AlternC/alternc-php-fpm
    cd alternc-php-fpm
    dpkg-buildpackage -us -uc
```

### Installation ###

This package relies heavily on the great packaging on Ondrej Sury at this address: [Sury packages](https://deb.sury.org/)

Ondrej provides us with all versions of php (from 5.6 to 8.1) for all current versions of debian (from oldoldstable to testing)

To use its repository do as follow:

```
wget https://packages.sury.org/php/README.txt -O install.sh
bash -x install.sh
```

In this case don't forget to pin this repository :
```
nano /etc/apt/preferences.d/sury
Package: *
Pin: origin "packages.sury.org"
Pin-Priority: 100

Package: libpcre*
Pin: origin "packages.sury.org"
Pin-Priority: 500

Package: libapache2-mod-php*
Pin: origin "packages.sury.org"
Pin-Priority: 500

Package: php*
Pin: origin "packages.sury.org"
Pin-Priority: 500
```

Finaly we can install package :


You can use our repository to install this package:

```
wget https://debian.alternc.org/key.txt -O - | apt-key add - 
apt update

# if php 5.6 is required (eg: on stretch or buster and you need old php :/)
apt install php5.6-fpm php5.6-cli php5.6-curl php5.6-gd php5.6-imap php5.6-intl php5.6-json php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-opcache php5.6-readline php5.6-soap php5.6-xml php5.6-zip
apt install alternc-php-fpm
mysql --defaults-file=/etc/alternc/my.cnf -e " INSERT IGNORE INTO domaines_type SET name='php56-fpm', description='PHP 5.6 FPM', target='DIRECTORY', entry='%SUB% IN A @@PUBLIC_IP@@', compatibility='txt,defmx,defmx2,mx,mx2', enable='ALL', need_dns=0, has_https_option=1;"
```

We recommend you to use --install-suggests to install all php-version-related modules

