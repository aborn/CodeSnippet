#!/bin/bash
################################################
#  install yum repo source
################################################

# for redhat (5.9) 
# setting 
# 64bit
wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm

# 32bit
# wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.i686.rpm
rpm -ivh rpmforge-release


