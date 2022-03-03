#!/usr/bin/env sh
 
export PATH=$PATH:/go/bin
 
gaiad init stakematic --chain-id cosmoshub-4
 
(echo $KEYPASSWD; echo $KEYPASSWD) | gaiad keys add myval
 
echo $KEYPASSWD | gaiad add-genesis-account myval 100000000000stake
 
# Create a gentx.
echo $KEYPASSWD | gaiad gentx myval 100000000stake --chain-id cosmoshub-4
 
# Add the gentx to the genesis file.
gaiad collect-gentxs
 
gaiad start
