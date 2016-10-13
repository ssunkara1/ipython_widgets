#!/usr/bin/env bash
set -e
nbExtFlags=$1

npm -v
if [ $? -eq 0 ]; then
    echo npm is installed
else
    echo "'npm -v' failed therefore npm is not installed.  In
    order to perform a developer install of ipywidgets you must
    have both npm and pip installed on your machine!"
    exit 1
fi
pip --version
if [ $? -eq 0 ]; then
    echo pip is installed
else
    echo "'pip --version' failed. therefore pip is not installed.
    In order to perform a developer install of ipywidgets you
    must have both pip and npm installed on your machine!"
    exit 1
fi

cd jupyter-js-widgets
npm install
cd ..
cd widgetsnbextension
npm install
npm run update
pip install -v -e .
jupyter nbextension install --py $nbExtFlags widgetsnbextension
jupyter nbextension enable --py $nbExtFlags widgetsnbextension
cd ..
pip install -v -e .
