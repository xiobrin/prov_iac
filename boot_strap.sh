
#!/bin/bash
#set -e

if [ $# -ne 2 ]; then
  echo "Please provide your redhat username & password"
  echo "Syntax is $0 <username> <password>"
  exit 1
fi

echo "Registering the host"
subscription-manager register --username $1 --password $2 --auto-attach

echo "Enabling optional RPMs"  
subscription-manager repos --enable=rhel-7-server-optional-rpms

echo "Enabling Extras"   
subscription-manager repos --enable=rhel-7-server-extras-rpms

echo "Installing epel" 
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
 
echo "Installing pip"    
yum install python-pip

echo "Installing Ansible"      
sudo pip install ansible
