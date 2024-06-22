#!/bin/bash
cd etl/py3
TIMEFORMAT=%R
brew install mongosh
echo "${time} Mongosh installed"
python3 -m venv parkenv
source ./parkenv/bin/activate
pip install geopandas 
pip install pymongo 
pip install python-dotenv 
pip freeze > requirements.txt
sh ../extractSigns.sh
