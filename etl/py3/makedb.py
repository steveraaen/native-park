import geopandas as gpd
import sqlite3

url= "modifiedBrooms.json"
df = gpd.read_file(url)
print(df)

# def query():
#         connection = sqlite3.connect("signs.db",)
#         gdf=gpd.read_file('modifiedBrooms.json')
#         gdf.to_sql('q1sub', connection, schema=None, if_exists='replace', index=True)
#         print(gdf.head())