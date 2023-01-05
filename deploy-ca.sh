target=10.0.0.208
scp $(ip route get 1 | awk '{print $NF;exit}').broker-info.subm root@$target:/root/kubernetes/submariner.io
