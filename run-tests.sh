#!/bin/bash


BASE_DIR="$(dirname $BASH_SOURCE)";


build_deployer () {
  dpkg-deb --build ${BASE_DIR}/deployer
}


build_docker_image () {
  echo "building a docker image"
  sudo docker image build -t deployer_test_image ${BASE_DIR} > /dev/null
}


run_docker_image () {
  sudo docker container run deployer_test_image
}


build_deployer \
  && build_docker_image \
  && run_docker_image \
  && echo "===========================" \
  && echo "Done."
