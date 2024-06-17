import geopandas as gpd

url= "./etl/py3/modifiedBrooms.json"
df = gpd.read_file(url)
print(df)

# with spatialite.connect('sl_temp.db') as db:
#     print(db.execute('SELECT spatialite_version()').fetchone()[0])

# def query():
#         connection = sqlite3.connect("signs.db",)
#         gdf=gpd.read_file('modifiedBrooms.json')
#         gdf.to_sql('q1sub', connection, schema=None, if_exists='replace', index=True)
#         print(gdf.head())


# mongo pw = Cenmed-gifpiw-0pypno