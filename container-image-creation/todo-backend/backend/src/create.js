const { MongoClient } = require('mongodb');
const url = 'mongodb://root:1234@127.0.0.1/';

MongoClient.connect(url,(err,db) => { // connect to the database
  if (err) throw err;
var dbase = db.db("todos"); //here
  dbase.createCollection("todos",(err,res) => { // create a new collection called todos
    if (err) throw err;
    console.log("todos collection created");
    db.close();
  });
});

