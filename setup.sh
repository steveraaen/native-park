#!/bin/bash
cd etl/py3
brew install mongosh
python3 -m venv parkenv
source ./parkenv/bin/activate
pip install geopandas 
pip install pymongo 
pip install python-dotenv 
pip freeze > requirements.txt
# python3 makedb.py
sh ../extractSigns.sh


# source deactivate