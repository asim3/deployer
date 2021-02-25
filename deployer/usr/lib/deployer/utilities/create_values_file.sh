#!/bin/bash


read_project_name () {
  printf "Kindly enter your project name: "; 
  read PROJECT_NAME;
}


[ -n "${1}" ] \
  && PROJECT_NAME="${1}" \
  || read_project_name;


# TODO: check if the project exist. if yes exit error

[ -d "$PROJECT_NAME" ] || mkdir $PROJECT_NAME;

[ -d "${PROJECT_NAME}/values" ] || mkdir "${PROJECT_NAME}/values";

