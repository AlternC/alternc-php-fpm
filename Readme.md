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

Ondrej provides us with all versions of php (from 5.6 to 8.2) for all current versions of debian (from oldoldstable to testing)

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
apt install php5.6-fpm php5.6-mysql php5.6-common
apt install php7*-gd php7*-mysql php7*-intl php7*-common
apt install php8.0-fpm php8.0-mysql php8.0-common
apt install php8.1-fpm php8.1-mysql php8.1-common
apt install php8.2-fpm php8.2-mysql php8.2-common
apt install alternc-php-fpm
```

We recommend you to use --install-suggests to install all php-version-related modules

