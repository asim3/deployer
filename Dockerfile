FROM debian:latest


COPY ./deployer.deb /
COPY ./tests/ /tests/


RUN apt-get -y update \
    && apt-get -y install git dpkg curl sudo python3-venv lsb-release \
    && git clone --depth 1 https://github.com/sstephenson/bats.git \
    && /bats/install.sh /usr/local \
    && dpkg --install /deployer.deb


RUN groupadd -r myuser \
    && useradd --no-log-init -mr -g myuser -G sudo myuser \
    && echo "myuser ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/myuser
USER myuser


ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "bats -t /tests " ]
