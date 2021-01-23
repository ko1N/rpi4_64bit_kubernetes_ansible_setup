# Raspberry Pi4 64-bit Kubernetes Ansible Setup

- Download the latest raspbian aarch64 beta image: https://downloads.raspberrypi.org/raspios_arm64/images/
- Install the image with `sudo dd bs=4M if=2020-08-20-raspios-buster-arm64.img of=/dev/sdX conv=fsync`
- Mount the boot partition
- Put a `ssh` file on the boot partition to expose SSH on first boot
- Optionally add a wpa_supplicant.conf file to the setup like described here: https://www.raspberrypi.org/documentation/configuration/wireless/headless.md

Put all the IP addresses and desired hostnames in the `inventory` file.

## Base install

Run the `setup-rpi-first-time.sh` script for all pis that have not been initialized yet.

The script will ask for a new password for the pi user as well as the regular user.

The script initializes a user with your current username and copies over the `~/.ssh/id_rsa.pub` file as an authorized key.

## Installing Kubernetes

Make sure your ssh key agent is loaded:
```bash
ssh-agent fish
ssh-add ~/.ssh/id_rsa
```

Then run the `setup-rpi-kubernetes.sh` script.

After kubernetes has been installed you want to connect to the `kube-master` pi and copy the `/etc/kubernetes/admin.conf` into your local `~/.kube/config` file.