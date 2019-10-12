#!/usr/bin/env bash
echo `virtualenv venv`
source "./venv/bin/activate"
echo `pip install --upgrade pip`
echo `pip install -r requirements.txt`
cd ./frontend
echo `yarn install`
echo `yarn build`
cd ..
echo `pip install -e .`