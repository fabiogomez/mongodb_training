# chunks

# - Logical groups of documents
# - Chuck can only live at one designated shard at a time
# - Shard key cardinality and frequency, chunk size will determinate number of chunk

# Jumbo chunks

# - larger than the defined chunk size
# - Cannot move jumbo chunks    
#   - Once marked as jumbo the balancer skips these chunks and avoids trying to move them
# - In some cases these will not be able to be split




# Lecture Instructions

# Show collections in config database:
use config
show collections

# Find one document from the chunks collection:
db.chunks.findOne()

# Change the chunk size:
use config
db.settings.save({_id: "chunksize", value: 2})

# Check the status of the sharded cluster:
sh.status()

# Import the new products.part2 dataset into MongoDB:
mongoimport /dataset/products.part2.json --port 26000 -u "m103-admin" -p "m103-pass" --authenticationDatabase "admin" --db