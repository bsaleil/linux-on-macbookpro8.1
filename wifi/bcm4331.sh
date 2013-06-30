#!/bin/bash

# Possible options
NETWORK=false

# Loop on command line args
for i in $@
do
	if [ $i = "-n" ]; then # -n, set network as true
		NETWORK=true
	fi
done

# Download b43-fwcutter
if $NETWORK; then
	echo "download b43-fwcutter..."
	wget "http://bues.ch/b43/fwcutter/b43-fwcutter-017.tar.bz2"
fi

# Extract b43-fwcutter
echo "extract b43-fwcutter..."
tar xjf b43-fwcutter-017.tar.bz2
cd "./b43-fwcutter-017"
# Build b43-fwcutter
echo "build b43-fwcutter..."
make
# Install b43-fwcutter
echo "install b43-fwcutter..."
sudo make install
cd ..


# Download b43-fwcutter
if $NETWORK; then
	echo "download firmware..."
	wget "http://www.lwfinger.com/b43-firmware/broadcom-wl-5.100.138.tar.bz2"
fi

# Extract firmware
export FIRMWARE_INSTALL_DIR="/lib/firmware"
echo "extract firmware..."
tar xjf broadcom-wl-5.100.138.tar.bz2
# Install firmware
sudo b43-fwcutter -w "$FIRMWARE_INSTALL_DIR" broadcom-wl-5.100.138/linux/wl_apsta.o

echo "reboot to get wifi!"

