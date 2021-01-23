#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=false
ansible-playbook setup-rpi-kubernetes.yml --user $(whoami) --ask-pass -kK -i inventory
