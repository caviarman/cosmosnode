FROM golang:1.17 AS builder

RUN git clone -b v5.0.0 https://github.com/cosmos/gaia && cd gaia && make install

ENV KEYPASSWD=Zydfhm2013

ENV PATH=$PATH:/go/bin

RUN gaiad init stakematic --chain-id cosmoshub-4

RUN (echo $KEYPASSWD; echo $KEYPASSWD) | gaiad keys add myval
 
RUN echo $KEYPASSWD | gaiad add-genesis-account myval 100000000000stake
 
# Create a gentx.
RUN echo $KEYPASSWD | gaiad gentx myval 100000000stake --chain-id cosmoshub-4
 
# Add the gentx to the genesis file.
RUN gaiad collect-gentxs
 
CMD ["gaiad", "start"]