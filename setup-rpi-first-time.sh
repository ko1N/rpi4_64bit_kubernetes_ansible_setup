#!/bin/bash

read -s -p "Enter new password for the new user: " NEWPASSWORD
echo ""

export ANSIBLE_HOST_KEY_CHECKING=false
ansible-playbook setup-rpi-first-time.yml --user ubuntu --ask-pass -i inventory --extra-vars newpassword=$NEWPASSWORD
