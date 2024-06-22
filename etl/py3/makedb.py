# import geopandas as gpd
import sys
import os
import json
from dotenv import load_dotenv
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi

load_dotenv()
monpw = os.getenv('PW_MONGO')

with open("./modifiedBrooms.json") as raw:
    sign_data = json.load(raw)

uri = f"mongodb+srv://sraaen:{monpw}@cluster0.u4d7h.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
client = MongoClient(uri, server_api=ServerApi('1'))
db = client["all-signs"]
Collection = db["sanit-signs"]
# mongoimport --uri mongodb+srv://sraaen:<PASSWORD>@cluster0.u4d7h.mongodb.net/<DATABASE> --collection <COLLECTION> --type <FILETYPE> --file <FILENAME>
try:
    client.admin.command('ping')
    print("Pinged your deployment. You successfully connected to MongoDB!")
except Exception as e:
    print(e)

Collection.insert_many(sign_data["features"])
x = Collection.find()
for data in x:
    print(data)
 
