FROM golang:1.17 AS builder

RUN git clone -b v6.0.4 https://github.com/cosmos/gaia && cd gaia && make install

ENV KEYPASSWD=Zydfhm2013

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh"]