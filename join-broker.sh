#!/bin/bash
set -e
mycluster=$(hostname)-cls

trap \
 "{ \
kubectl taint nodes $(hostname) node-role.kubernetes.io/master:NoSchedule ; exit 255; }" \
SIGINT SIGTERM ERR EXIT

source ./connect.conf

# release taint
kubectl taint nodes $(hostname) node-role.kubernetes.io/master-

# set master node label for submariner
kubectl label node $(hostname) submariner.io/gateway=true --overwrite

#subctl join $BROKER.broker-info.subm \
#--clusterid $MYCLUSTER \
#--cable-driver wireguard \
#--image-override submariner-gateway=krunivs/submariner-gateway:devel \
#--repository krunivs \
#--version devel \
#--natt=false

subctl join $BROKER.broker-info.subm \
--clusterid $MYCLUSTER \
--cable-driver wireguard \
--natt=false

# recover taint for master node
kubectl taint nodes $(hostname) node-role.kubernetes.io/master:NoSchedule
