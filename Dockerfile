FROM debian:latest
MAINTAINER Scott Pepper <scott-docker@pep.id.au>
RUN apt-get update && apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
    nano wget curl bash && \
    apt-get clean && rm -rf /var/lib/apt/lists/

RUN mkdir bitcash && cd bitcash
RUN curl -o bitcash.tar.gz https://www.bitcoinunlimited.info/downloads/bch-unlimited-1.8.0.0-linux64.tar.gz
RUN tar -xvf bitcash.tar.gz --strip-components 1
ENTRYPOINT ["/bin/bitcoind", "-datadir", "/data"]

