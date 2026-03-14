#!/bin/bash

component=$1
environment=$2
dnf install ansible -y
dnf install python3-pip -y 
pip3 install boto3 botocore

cd /home/ec2-user
git clone https://github.com/ImManiKanta/terraform-ansible.git

cd terraform-ansible
git pull
ansible-playbook -e component=$component -e env=$environment roboshop.yaml