 

#export JSON 

mongoexport --uri="mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies" --collection=sales --out=sales.json
mongoimport --uri="mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies" --drop sales.json#export BSON 

mongodump --uri "mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies"mongorestore --uri "mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies"  --drop dump#conecction 

mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"#select database 

show dbsuse sample_trainingshow collectionsdb.zips.find({"state": "NY"})it iterates 

# find command 

db.zips.find({"state": "NY"}).count()db.zips.find({"state": "NY", "city": "ALBANY"})db.zips.find({"state": "NY", "city": "ALBANY"}).pretty()#shell conection 

mongo "mongodb+srv://sandbox.k13w3y2.mongodb.net/myFirstDatabase" --username admindb.trips.find({"birth year":1961, "start station name": "Howard St & Centre St"}).pretty()db.zips.find({"state":"NY"}).pretty() 

db.inspections.find({"date": "Feb 20 2015"}).count() 

#insert 

use sample_trainingdb.inspections.findOne(); 

db.inspections.insert({ 

      "_id" : ObjectId("56d61033a378eccde8a8354f"), 

      "id" : "10021-2015-ENFO", 

      "certificate_number" : 9278806, 

      "business_name" : "ATLIXCO DELI GROCERY INC.", 

      "date" : "Feb 20 2015", 

      "result" : "No Violation Issued", 

      "sector" : "Cigarette Retail Dealer - 127", 

      "address" : { 

              "city" : "RIDGEWOOD", 

              "zip" : 11385, 

              "street" : "MENAHAN ST", 

              "number" : 1712 

         } 

  })db.inspections.insert({ 

      "id" : "10021-2015-ENFO", 

      "certificate_number" : 9278806, 

      "business_name" : "ATLIXCO DELI GROCERY INC.", 

      "date" : "Feb 20 2015", 

      "result" : "No Violation Issued", 

      "sector" : "Cigarette Retail Dealer - 127", 

      "address" : { 

              "city" : "RIDGEWOOD", 

              "zip" : 11385, 

              "street" : "MENAHAN ST", 

              "number" : 1712 

         } 

  })db.inspections.find({"id" : "10021-2015-ENFO", "certificate_number" : 9278806}).pretty()db.inspections.insert([{ "_id": 1, "test": 1 },{ "_id": 1, "test": 2 }, 

                       { "_id": 3, "test": 3 }],{ "ordered": false }) 

#View collections 

show collections 

#INCREMENT value 

db.zips.updateMany({ "city": "HUDSON" }, { "$inc": { "pop": 10 } })#update value, if the value does not exits it will create 

db.zips.updateOne({ "zip": "12534" }, { "$set": { "pop": 17630 } })#add element to arrya scores 

db.grades.updateOne({ "student_id": 250, "class_id": 339 }, 

                    { "$push": { "scores": { "type": "extra credit", 

                                             "score": 100 } 

                                } 

                     })#delete documents 

db.inspections.deleteMany({ "test": 1 })db.inspections.deleteOne({ "test": 3 }) 

#delete collections 

db.inspection.drop() 

#query operatorsdb.trips.find({ "tripduration": { "$lte" : 70 }, 

                "usertype": { "$ne": "Subscriber" } }).pretty()db.trips.find({ "tripduration": { "$lte" : 70 }, 

                "usertype": { "$eq": "Customer" }}).pretty()db.trips.find({ "tripduration": { "$lte" : 70 }, 

                "usertype": "Customer" }).pretty() 

db.zips.find({ "pop": { "$lte" : 1000 }}).pretty() 

#query operations 

AND  

OR  

NOR 

NOT 

use sample_training 

db.routes.find({ "$and": [ { "$or" :[ { "dst_airport": "KZN" }, 

                                    { "src_airport": "KZN" } 

                                  ] }, 

                          { "$or" :[ { "airplane": "CR2" }, 

                                     { "airplane": "A81" } ] } 

                         ]}).pretty() 

db.inspections.find({"result ": "Out of Business", "sector": "Home Improvement Contractor - 100"}) 

sample_training.inspections collection where the inspection date is either "Feb 20 2015", or "Feb 21 2015" and the company is not part of the "Cigarette Retail Dealer - 127" sector 

db.inspections.find( 

  { "$or": [ { "date": "Feb 20 2015" }, 

             { "date": "Feb 21 2015" } ], 

    "sector": { "$ne": "Cigarette Retail Dealer - 127" }}).pretty()db.zips.find( 

  { "$or": [ { "pop": "Feb 20 2015" }, 

             { "date": "Feb 21 2015" } ], 

    "sector": { "$ne": "Cigarette Retail Dealer - 127" }}).pretty()db.zips.find({ "$or":  "pop": { "$gt": 1000000 }, "pop": { "$lt": 5000 }}).pretty()db.zips.updateMany({ "city": "HUDSON" }, { "$inc": { "pop": -10 } })db.zips.find({ "$or":  [ { "pop": { "$gt": 1000000 }}, {"pop": { "$lt": 5000 }} ]}).count() 

db.companies.find( 

{ 

    "$and":  

    [ 

 
 

        {  

            "$or":   

                [ 

                    {"founded_year": 2004} , {"founded_month": 10 } 

                ]  

        },  

        {  

            "$or":   

                [ 

                    {"category_code": "social"} , {"category_code": "web" } 

                ]  

        }  

    ] 

}, {"founded_year":1, "founded_month":1, "category_code":1}).count() 

db.listingsAndReviews.find({ "reviews": { "$size": 50 }, "accommodates": { "$gt": 6 } }, {"name":1}) 

[ { _id: '4294289', name: 'Sunset Beach Lodge Retreat' } ] 

#export JSON 

mongoexport --uri="mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies" --collection=sales --out=sales.jsonmongoimport --uri="mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies" --drop sales.json#export BSON 

mongodump --uri "mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies"mongorestore --uri "mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies"  --drop dump#conecction 

mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"#select database 

#show databases
show dbs

use sample_trainingshow collectionsdb.zips.find({"state": "NY"})it iterates 

# find command 

db.zips.find({"state": "NY"}).count()db.zips.find({"state": "NY", "city": "ALBANY"})db.zips.find({"state": "NY", "city": "ALBANY"}).pretty()#shell conection 

mongo "mongodb+srv://sandbox.k13w3y2.mongodb.net/myFirstDatabase" --username admindb.trips.find({"birth year":1961, "start station name": "Howard St & Centre St"}).pretty()db.zips.find({"state":"NY"}).pretty() 

db.inspections.find({"date": "Feb 20 2015"}).count() 

#insert 

use sample_trainingdb.inspections.findOne(); 

db.inspections.insert({ 

      "_id" : ObjectId("56d61033a378eccde8a8354f"), 

      "id" : "10021-2015-ENFO", 

      "certificate_number" : 9278806, 

      "business_name" : "ATLIXCO DELI GROCERY INC.", 

      "date" : "Feb 20 2015", 

      "result" : "No Violation Issued", 

      "sector" : "Cigarette Retail Dealer - 127", 

      "address" : { 

              "city" : "RIDGEWOOD", 

              "zip" : 11385, 

              "street" : "MENAHAN ST", 

              "number" : 1712 

         } 

  })db.inspections.insert({ 

      "id" : "10021-2015-ENFO", 

      "certificate_number" : 9278806, 

      "business_name" : "ATLIXCO DELI GROCERY INC.", 

      "date" : "Feb 20 2015", 

      "result" : "No Violation Issued", 

      "sector" : "Cigarette Retail Dealer - 127", 

      "address" : { 

              "city" : "RIDGEWOOD", 

              "zip" : 11385, 

              "street" : "MENAHAN ST", 

              "number" : 1712 

         } 

  })db.inspections.find({"id" : "10021-2015-ENFO", "certificate_number" : 9278806}).pretty()db.inspections.insert([{ "_id": 1, "test": 1 },{ "_id": 1, "test": 2 }, 

                       { "_id": 3, "test": 3 }],{ "ordered": false }) 

#View collections 

show collections 

#INCREMENT value 

db.zips.updateMany({ "city": "HUDSON" }, { "$inc": { "pop": 10 } })#update value, if the value does not exits it will create 

db.zips.updateOne({ "zip": "12534" }, { "$set": { "pop": 17630 } })#add element to arrya scores 

db.grades.updateOne({ "student_id": 250, "class_id": 339 }, 

                    { "$push": { "scores": { "type": "extra credit", 

                                             "score": 100 } 

                                } 

                     })#delete documents 

db.inspections.deleteMany({ "test": 1 })db.inspections.deleteOne({ "test": 3 }) 

#delete collections 

db.inspection.drop() 

#query operatorsdb.trips.find({ "tripduration": { "$lte" : 70 }, 

                "usertype": { "$ne": "Subscriber" } }).pretty()db.trips.find({ "tripduration": { "$lte" : 70 }, 

                "usertype": { "$eq": "Customer" }}).pretty()db.trips.find({ "tripduration": { "$lte" : 70 }, 

                "usertype": "Customer" }).pretty()


mongoimport --host "localhost" --port 26000 --file  /dataset/products.json -u  "m103-admin" -p  "m103-pass" --db m103 -c products --authenticationDatabase admin

 