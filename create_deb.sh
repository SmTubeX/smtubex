#! /bin/sh
 
ln -s debian-orig debian_10
cp debian-orig/changelog-orig debian-orig/changelog

./get_svn_revision.sh
#dch -v 20.6.0-`cat svn_revision` "New version"

#dpkg-buildpackage -rfakeroot

# This should be faster:
rm build-stamp
rm src/smtube
fakeroot debian/rules build
fakeroot debian/rules binary

dh_clean
rm debian-orig/changelog
rm debian
