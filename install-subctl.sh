# install subctl
rm -f /sbin/subctl
if [ ! -f ~/.local/bin/subctl ]; then
  curl -Ls https://get.submariner.io | bash
fi
ln -s ~/.local/bin/subctl /sbin/

