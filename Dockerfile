FROM debian:latest


COPY ./deployer.deb /
COPY ./tests/ /tests/


RUN apt-get -y update \
    && apt-get -y install git dpkg python3-venv \
    && git clone --depth 1 https://github.com/sstephenson/bats.git \
    && /bats/install.sh /usr/local \
    && dpkg --install /deployer.deb


ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "bats -t /tests " ]
