#!/usr/bin/env sh

export PATH=$PATH:/go/bin

initNode() {
    gaiad init stakematic --chain-id cosmoshub-4
}

start() {
    gaiad start --x-crisis-skip-assert-invariants $@
}

case $1 in
    initNode) shift && initNode $@;;
    start) shift && start $@;;
    *) echo "Cannot find command" && exit 1;;
esac
