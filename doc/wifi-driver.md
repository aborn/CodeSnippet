wifi-driver.md
#########

### INTRO
install wifi-driver in linux  OURLINK WU708E  realtek 8192du

### DOWNLOAD
download driver source code
1. git clone https://github.com/lwfinger/rtl8192du.git
2. git clone https://github.com/aborn/rtl8192du.git

### COMPILE AND INSTALL
cd DI
sudo -s
make
sudo make install

### QA
implicit declaration of function ‘daemonize’
http://askubuntu.com/questions/290452/installing-workaround-realtek-drivers-for-edimax-but-getting-error

add
void daemonize(char *, char *);
in include/osdep_service.h 


### process A
aborn@aborn-lenovo ~/sw/drivers/rtl8192du
 % sudo make install
install -p -m 644 8192du.ko  /lib/modules/3.8.0-35-generic/kernel/drivers/net/wireless/
mkdir -p /lib/firmware/rtlwifi
cp -n rtl8192dufw*.bin /lib/firmware/rtlwifi/.
/sbin/depmod -a 3.8.0-35-generic

### process
aborn@aborn-lenovo ~/VirtualBox/share/wifi_network_driver/Driver/linux/driver/rtl8192DU_linux_v4.0.0_5260.20120921
 % sudo make install
install -p -m 644 8192du.ko  /lib/modules/3.8.0-35-generic/kernel/drivers/net/wireless/
/sbin/depmod -a 3.8.0-35-generic



