#!/bin/zsh
#
# raumzeit.sh - Download all raumzeit podcasts
#
# Copyright (c) 2013 by Christian Rebischke <Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
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
# Email : Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d
# Github: www.github.com/Shibumi
# GPG: E2C0DC2A

#Download archive-file
wget http://raumzeit-podcast.de/archiv

#grep podcast-files from archive-file
cat archiv | egrep -o '(raumzeit-podcast\.de/[0-9][0-9][0-9][0-9]/[0-9][0-9]/[0-9][0-9]/rz[0-9][0-9][0-9][^"[:space:]]+)' > LOG


#clean up urls
sed 's/<\/a>//g' LOG > archiv
sed 's/#.*$//g' archiv > LOG
cut -d"/" -f5 LOG > archiv

#sort everything and prepare download
cat archiv | sort -u > LOG

#clean up
rm archiv

#downloading podcast files...
for i in $(cat LOG)
do
	wget "http://meta.metaebene.me/media/raumzeit/"$i".oga"
done

