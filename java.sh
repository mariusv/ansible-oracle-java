#!/usr/bin/env bash

echo
echo -e "\033[38;5;255m\033[48;5;234m\033[1m  Oracle Java Installer  \033[0m"
echo

if [[ "$(ansible --version | grep -oe '1\(.[0-9]\)*')" < "1.8.2" ]]
then
    echo "Ansible version 1.8.2 or higher is required."
    exit -1;
fi

echo -n "What Oracle Java version you want to install?
  1. v7
  2. v8
  3. Both v7 and v8
: "

read reply

case "$reply" in
  1) echo; echo; ansible-playbook playbooks/oracle_v7.yml;;
  2) echo; echo; ansible-playbook playbooks/oracle_v8.yml;;
  3) echo; echo; ansible-playbook playbooks/oracle_v8_v7.yml;;
esac

