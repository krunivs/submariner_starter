#! /bin/bash

set -e
version=0.14.0-m0

# install subctl
rm -f /sbin/subctl
if [ ! -f ~/.local/bin/subctl ]; then
  curl -Ls https://get.submariner.io | bash
fi
ln -s ~/.local/bin/subctl /sbin/

# install broker
rm -rf broker-info.subm

#subctl deploy-broker --version $version
subctl deploy-broker --version $version --globalnet 
#subctl deploy-broker --version $version
#--repository krunivs --version devel --globalnet
#subctl deploy-broker $MYCLUSTER --globalnet --kubeconfig ~/.kube/config
mv broker-info.subm $(ip route get 1 | awk '{print $NF;exit}').broker-info.subm
