#!/bin/bash

sudo virsh --connect qemu:///system start win11;
sudo virt-viewer --connect qemu:///system win11;