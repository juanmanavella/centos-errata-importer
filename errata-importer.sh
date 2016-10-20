# Centos errata importer. A script to automate importing errata information on a spacewalk server.
# For running within a crontab how oftwn you decides.
#
#!/bin/bash

SPACEWALK_USER='admin'
SPACEWALK_PASS='YOURPASS'
wget http://cefs.steve-meier.de/errata-import.tar -O /tmp/errata-import.tar
mkdir -p /usr/apps
tar -xvf /tmp/errata-import.tar -C /usr/apps
wget -N http://cefs.steve-meier.de/errata.latest.xml -O /usr/apps/errata.latest.xml
/usr/apps/errata-import.pl --server 127.0.0.1 --errata errata.latest.xml --publish

exit 0
