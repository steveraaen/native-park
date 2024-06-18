#!/bin/bash
cd etl/py3
pwd
python3 -m venv parkenv
source ./parkenv/bin/activate
python3 -m pip install "pymongo[srv]"
python3 -m pip install python-dotenv
brew install mongosh
pip3 install geopandas 
sh ../extractSigns.sh


# source deactivate