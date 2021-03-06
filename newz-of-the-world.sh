#!/bin/zsh
#
# newz-of-the-world.sh - Download all newz-of-the-world.com podcasts
#
# Copyright (c) 2013 by Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/
#
#======================================================================
# Author: Christian Rebischke
# Email : echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d
# Github: www.github.com/Shibumi
#

#Download archive-file
wget http://newz-of-the-world.com/archive

#grep podcast-files from archive-file
cat archive | egrep -o '(metaebene\.me/media/newz/newz[0-9][0-9][0-9].*\.jpg)' > LOG

#clean up urls
cut -d"/" -f4 LOG > archive
cut -d"." -f1 archive > LOG

#sort everything and prepare download
cat LOG | sort -u > archive
cat archive > LOG
#clean up
rm archive
#downloading podcast files...
for i in $(cat LOG)
do
	wget "http://meta.metaebene.me/media/newz/"$i".oga"
done

