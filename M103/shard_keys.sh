# Shard Keys

# Show Transcript
# Lecture Notes
# Download Course Materials
# At 2:35, Ravind mentions that the shard key value is immutable.

# As of MongoDB 4.2, the shard key values are mutable, even though the shard key itself is immutable. If you're interested, you can read more in the Shard Key Values documentation.

# As of MongoDB 4.4, you can use refineCollectionShardKey to update a document's shard key value, unless the shard key field is the immutable _id field. If you're interested, you can read more in the refineCollectionShardKey documentation.

# Lecture Instructions

# If you'd like to shard a collection, you can find instructions to create a shard key here:

# Show collections in m103 database:
use m103
show collections

# Enable sharding on the m103 database:
sh.enableSharding("m103")

# Find one document from the products collection, to help us choose a shard key:
db.products.findOne()

# Create an index on sku:
db.products.createIndex( { "sku": 1 } )

# Shard the products collection on sku:
sh.shardCollection( "m103.products", { "sku": 1 } )

# Checking the status of the sharded cluster:
sh.status()
