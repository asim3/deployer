#!/bin/bash

PROJECT_NAME=$1


/usr/lib/deployer/utilities/initiate

# TODO: add .venv inside the project folder

[ -d ".venv" ] || python3 -m venv .venv
source .venv/bin/activate
pip install Django \
&& django-admin startproject $PROJECT_NAME \
&& pip freeze > $PROJECT_NAME/requirements.txt
