#!/bin/bash

read -s -p "Enter new password for the pi user: " NEWPASSWORD
echo ""

export ANSIBLE_HOST_KEY_CHECKING=false
ansible-playbook setup-rpi-first-time.yml --user pi --ask-pass -i inventory --extra-vars newpassword=$NEWPASSWORD
