//10 most exspensive stocks in s&p according to price
//Sort by price in descending order
//Limit to 10, show symbol, name, price
db.stocks.aggregate([
    {$sort: {"Price":-1}}, 
    {$skip:10},
    {$limit: 10},
    {$project: {"Symbol":1, "Name":1, "Price":1, "_id":0}}
    
]);

//Show the population of the 10 least populus cities in MO
//Only look at documents where state == "MO" - match
//Group by city -$group
db.zips.aggregate([
    {$match:{state:"MO"}},
    {$group:{_id:"$city", TotalPopulation:{$sum:"$pop"}}},
    {$sort: {TotalPopulation:1}}, 
    {$limit: 10}
    
]);

//What is the population of columbia MO?
db.zips.aggregate([
    {$match:{state:"MO",city:"COLUMBIA"}},
    {$group:{_id:"$city", TotalPopulation:{$sum:"$pop"}}}
    
    
]);

//List cities in MO where population is greater than 50,000
//Sort ascending
db.zips.aggregate([
    {$match:{state:"MO"}},
    {$group:{_id:"$city", TotalPopulation:{$sum:"$pop"}}},
    {$match:{TotalPopulation:{$gte:50000}}},
    {$sort: {TotalPopulation:1}}
    
    
]);

//How many zip codes in the state of Florida?

db.zips.aggregate([
    {$match:{state:"FL"}},
    {$count: "Total Zips in FL"}
    
])

//Difference between $sum and $count
db.zips.aggregate([
    {$match:{state:"MO",city:"COLUMBIA"}},
    {$group:{_id:"$city", TotalPopulation:{$sum:"$pop"}}}
]);

db.zips.aggregate([
    {$match:{state:"MO",city:"COLUMBIA"}},
])
