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

## http://tecadmin.net/top-5-yum-repositories-for-centos-rhel-systems/#
## Adding EPEL Repository
# CentOS/RHEL 6, 32 Bit (i386):
# rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# CentOS/RHEL 6, 64 Bit x86_64):
# rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# CentOS/RHEL 5, 32 Bit (i386):
# rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm

# CentOS/RHEL 5, 64 Bit (x86_64):
# rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
