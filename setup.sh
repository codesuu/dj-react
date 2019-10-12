#!/usr/bin/env bash
echo '********** virtualenv venv **********'
echo `virtualenv venv`
source "./venv/bin/activate"
echo '********** pip **********'
echo `pip install --upgrade pip`
echo '********** requirements **********'
echo `pip install -r requirements.txt`
echo '********** setup.py **********'
echo `pip install -e .`
echo '********** yarn install **********'
echo `yarn install --cwd ./frontend`
echo '********** yarn build **********'
echo `cd "./frontend" && yarn build`
echo `python manage.py migrate`
echo '********** finished **********'
echo 'run ("python manage.py runserver 0.0.0.0:8000")'
