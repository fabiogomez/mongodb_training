mongod

mongo

#shut down mongod
use admin
db.shutdownServer()
exit

mongod --help

#change db path
mongod --dbpath <directory path>

#change  db port
mongod --port <port number>
#alowed ips
mongod --bind_ip 123.123.123.123

mongod --bind_ip localhost,123.123.123.123

mongod --dbpath /data/db --logpath /data/log/mongod.log --fork --replSet "M103" --keyFile /data/keyfile --bind_ip "127.0.0.1,192.168.103.100" --tlsMode requireTLS --tlsCAFile "/etc/tls/TLSCA.pem" --tlsCertificateKeyFile "/etc/tls/tls.pem"

storage:
  dbPath: "/data/db"
systemLog:
  path: "/data/log/mongod.log"
  destination: "file"
replication:
  replSetName: M103
net:
  bindIp : "127.0.0.1,192.168.103.100"
tls:
  mode: "requireTLS"
  certificateKeyFile: "/etc/tls/tls.pem"
  CAFile: "/etc/tls/TLSCA.pem"
security:
  keyFile: "/data/keyfile"
processManagement:
  fork: true

#enable auth
net:
   bindIp: 127.0.0.1
   port: 27000

security:
    authorization: "enable"


ls -l /data/db
ls -l /data/db/diagnostic.data
ls -l /data/db/journal
ls /tmp/mongodb-27017.sock

#launch  from file
mongod -f mongod.conf

#User management commands:
db.createUser()
db.dropUser()

#Collection management commands:
db.<collection>.renameCollection()
db.<collection>.createIndex()
db.<collection>.drop()


#Database management commands:
db.dropDatabase()
db.createCollection()

#Database status command:
db.serverStatus()


#Creating index with Database Command:
db.runCommand({
   "createIndexes":"<collection_name>",
       "indexes":[
          {
             "key":{ "product": 1 },
             "name": "name_index"
          }
       ]
    }
 )


#Creating index with Shell Helper:

db.<collection>.createIndex(
  { "product": 1 },
  { "name": "name_index" }
)

#Introspect a Shell Helper:
db.<collection>.createIndex

#LOGGING***********************************
#*******************************************


#Get the logging components:
mongo admin --host 192.168.103.100:27000 -u m103-admin -p m103-pass --eval '
  db.getLogComponents()
'
#Change the logging level:
mongo admin --host 192.168.103.100:27000 -u m103-admin -p m103-pass --eval '
  db.setLogLevel(0, "index")
'
#View the logs through the Mongo shell:
db.adminCommand({ "getLog": "global" })

#View the logs through the command line:
tail -f /data/db/mongod.log

#Update a document:
mongo admin --host 192.168.103.100:27000 -u m103-admin -p m103-pass --eval '
  db.products.update( { "sku" : 6902667 }, { $set : { "salePrice" : 39.99} } )
'
#Look for instructions in the log file with grep:
grep -i 'update' /data/db/mongod.log

#PROFILE SLOW QUERIES***********************************
#*******************************************

#To list all of the collection names you can run this command:

db.runCommand({listCollections: 1})

#Get profiling level:
mongo newDB --host 192.168.103.100:27000 -u m103-admin -p m103-pass --authenticationDatabase admin --eval '
  db.getProfilingLevel()
'
#Set profiling level:
mongo newDB --host 192.168.103.100:27000 -u m103-admin -p m103-pass --authenticationDatabase admin --eval '
  db.setProfilingLevel(1)
'
#Show collections:
mongo newDB --host 192.168.103.100:27000 -u m103-admin -p m103-pass --authenticationDatabase admin --eval '
  db.getCollectionNames()
'
#Note: show collections only works from within the shell

#Set slowms to 0:
mongo newDB --host 192.168.103.100:27000 -u m103-admin -p m103-pass --authenticationDatabase admin --eval '
  db.setProfilingLevel( 1, { slowms: 0 } )
'
#Insert one document into a new collection:
mongo newDB --host 192.168.103.100:27000 -u m103-admin -p m103-pass --authenticationDatabase admin --eval '
  db.new_collection.insert( { "a": 1 } )
'
#Get profiling data from system.profile:
mongo newDB --host 192.168.103.100:27000 -u m103-admin -p m103-pass --authenticationDatabase admin --eval '
  db.system.profile.find().pretty()
'

#config file
echo '
storage:
  dbPath: /var/mongodb/db
net:
  bindIp: localhost
  port: 27000
security:
  authorization: enabled
systemLog:
   destination: file
   path: " /var/mongodb/logs/mongod.log"
   logAppend: true
processManagement:
   fork: true'



#create mongo admin******************************
#***********************************************
mongo --host 127.0.0.1:27017

use admin

db.createUser({
  user: "root",
  pwd: "root123",
  roles : [ "root" ]
})

#Connect to mongod and authenticate as root:
mongo --username root --password root123 --authenticationDatabase admin

#Run DB stats:
db.stats()

#Shutdown the server:
use admin
db.shutdownServer()



#Authenticate as root user:
mongo admin -u root -p root123

#Create security officer:
db.createUser(
  { user: "security_officer",
    pwd: "h3ll0th3r3",
    roles: [ { db: "admin", role: "userAdmin" } ]
  }
)

#Create database administrator:
db.createUser(
  { user: "dba",
    pwd: "c1lynd3rs",
    roles: [ { db: "admin", role: "dbAdmin" } ]
  }
)

#Grant role to user:
db.grantRolesToUser( "dba",  [ { db: "playground", role: "dbOwner"  } ] )

#Show role privileges:
db.runCommand( { rolesInfo: { role: "dbOwner", db: "playground" }, showPrivileges: true} )


#Create database administrator:
db.createUser(
  { user: "m103-application-user",
    pwd: "m103-application-pass",
    roles: [ { db: "applicationData", role: "readWrite" } ]
  }
)

mongo --username m103-admin --password m103-pass --authenticationDatabase admin

mongo admin --host 192.168.103.100:27000 -u m103-admin -p m103-pass --eval '


