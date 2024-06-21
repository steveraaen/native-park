import geopandas as gpd
import sys
import os
from dotenv import load_dotenv
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi

load_dotenv()

monpw = os.getenv('PW_MONGO')

# url= "./modifiedBrooms.json"
# df = gpd.read_file(url)
# print(df)
uri = f"mongodb+srv://sraaen:{monpw}@cluster0.u4d7h.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
client = MongoClient(uri, server_api=ServerApi('1'))
print(client.list_databases)
# try:
#     client.admin.command('ping')
#     print("Pinged your deployment. You successfully connected to MongoDB!")
# except Exception as e:
#     print(e)

