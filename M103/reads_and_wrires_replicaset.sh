# Connecting to the replica set:
mongo --host "m103-example/m103:27011" -u "m103-admin" -p
"m103-pass" --authenticationDatabase "admin"

# Checking replica set topology:
rs.isMaster()


#Inserting one document into a new collection:
use newDB
db.new_collection.insert( { "student": "Matt Javaly", "grade": "A+" } )

# Connecting directly to a secondary node (this node may not be a secondary in your replica set!):
mongo --host "m103:27012" -u "m103-admin" -p "m103-pass"
--authenticationDatabase "admin"


# Attempting to execute a read command on a secondary node (this should fail):
show dbs


# Enabling read commands on a secondary node:
rs.slaveOk()

# Reading from a secondary node:
use newDB
db.new_collection.find()

# Attempting to write data directly to a secondary node (this should fail, because we cannot write data directly to a secondary):
db.new_collection.insert( { "student": "Norberto Leite", "grade": "B+" } )

#Shutting down the server (on both secondary nodes)
use admin
db.shutdownServer()

# Connecting directly to the last healthy node in our set:
mongo --host "m103:27011" -u "m103-admin" -p "m103-pass"
--authenticationDatabase "admin"

# Verifying that the last node stepped down to become a secondary when a majority of nodes in the set were not available:
rs.isMaster()