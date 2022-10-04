//In class queries

//check structure and return all
db.zips.findOne();
db.zips.find();


//db.collection.find({query filter criteria},{display key value})
//Display city names and zip codes from missouri
db.zips.find({"state":"MO"},{"_id":1,"city":1,"state":1});

//How many zip codes in missouri?
db.zips.find({"state":"MO"}).count;

//List all cities and zip codes from MO, KS, or IL
db.zips.find({$or:[{"state":"MO"},{"state":"IL"},{"state":"KS"}]},{"_id":1,"city":1,"state":1})

//Display zip codes with pops less than 500
db.zips.find({"pop":{$lte:500}},{"_id":1,"city":1,"pop":1,"state":1})

//Display stocks where price >=100
db.stocks.find({"Price":{$gte:100}},{"_id":0, "Name":1,"Earnings/Share":1,"Sector":1}).pretty();


