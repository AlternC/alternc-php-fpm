# Get the package #

## Build own package ##

You can compile this package with:

```
    apt install build-essential debhelper git
    git clone https://github.com/AlternC/alternc-php-fpm
    cd alternc-php-fpm
    dpkg-buildpackage -us -uc
```

## From github ##

You can obtain nightly and last stable package from the dedicated page : [releases page](https://github.com/AlternC/alternc-php-fpm/releases)

## From our repository ##

Our stable repository is avalaible at https://debian.alternc.org

```
echo "deb http://debian.alternc.org/ $(lsb_release -cs) main" >> /etc/apt/sources.list.d/alternc.list 
wget https://debian.alternc.org/key.txt -O - | apt-key add - 
apt update
```

# How to use #

This package supports both Alternc 3.3 and 3.5. An autodection script adapts templating installation following AlternC version.
A php-fpm type is created for each fpm version detected during installation in  /etc/php/ directory.
When a new phpX.Y-fpm package is detected, AlternC installs related template.

A version-agnostic php-fpm template is provided at /etc/alternc/templates/3.x/apache2 directory. All php-fpm template are declined from this template.
When a php-fpm template is set you can override it. Installation process don't overwrite any php-fpm template.

If a php-X.Y-fpm package is deleted, the type is also removed from AlternC and won't be proposed any longer. All existing domains maintain  their template. Admin must update subdomain by subdomain.


# Sury Dependencies #

This package relies heavily by the great packaging on Ondrej Sury at this address: [Sury packages](https://deb.sury.org/)
Ondrej provides us with all versions of php (from 5.6 to 8.x) for all current versions of debian (from oldoldstable to testing)

To use this repository :
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

