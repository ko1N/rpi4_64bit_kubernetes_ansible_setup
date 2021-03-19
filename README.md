# Raspberry Pi4 64-bit Kubernetes Ansible Setup

- Download the latest ubuntu server 64bit or lts image: https://ubuntu.com/download/raspberry-pi
- Extract the image: `unxz ubuntu-20.04.2-preinstalled-server-arm64+raspi.img.xz`
- Install the image with `sudo dd bs=4M if=ubuntu-20.04.2-preinstalled-server-arm64+raspi.img of=/dev/sdX conv=fsync`
- Optionally setup wifi before booting: https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry-pi#3-wifi-or-ethernet

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