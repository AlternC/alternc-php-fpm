### Packaging ###

Actualy we don't provide again a direct download / repository service. You can compile this package with
```
    apt install build-essential
    dpkg-buildpackage -us -uc

```

### Installation ###

We could recommend this installation procedure. 

To get all packages without build them, you can use [Sury packages](https://deb.sury.org/)
```
wget https://packages.sury.org/php/README.txt -O -|bash -x
```

In this case don't forget to pin this repository :
```
nano /etc/apt/preferences.d/sury
Package: *
Pin: origin "packages.sury.org"
Pin-Priority: 100
```

Finaly we can install package :
```
# if php 5.6 is required
apt install php5.6-fpm php5.6-mysql
# at least all default php7.x packages
apt install php7*-gd php7*-mysql php7*-intl
dpkg -i /tmp/alternc-php-fpm.*.deb
apt install -f
```