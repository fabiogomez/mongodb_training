# Targeted Queries vs Scatter Gather: Part 1


# A find() query where the predicate matches the shard key, and the query can be targeted:
db.products.find( { "sku": 20009151 } )

# A find() query where the predicate does not match the shard key, and the query is scatter gather:
db.products.find( { "type": "movie" } )

# Example of a compound shard key:
{ "sku": 1, "type": 1, "name": 1 }

# Examples of queries that would be targeted with the compound shard key:
db.products.find( { "sku": ... } )
db.products.find( { "sku": ... , "type": ... } )
db.products.find( { "sku": ... , "type": ... , "name": ... } )

# Examples of queries that would be scatter-gather with the compound shard key:
db.products.find( { "type": ... } )
db.products.find( { "name": ... } )


# - targeted quries require the shard key in the query
# - ranged queries on the shard key may still require targeting every shard in the cluster
# - without the shard key, the monfos must perform a scatter-gather query

# Show collections in the m103 database:
use m103
show collections

# Targeted query with explain() output:
db.products.find({"sku" : 1000000749 }).explain()

# Scatter gather query with explain() output:

db.products.find( {
  "name" : "Gods And Heroes: Rome Rising - Windows [Digital Download]" }
).explain()