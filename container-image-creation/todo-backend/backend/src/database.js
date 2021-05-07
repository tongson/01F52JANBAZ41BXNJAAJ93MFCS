const { MongoClient } = require('mongodb');

const database = module.exports;

database.connect = async function connect() {
  database.client = await MongoClient.connect('mongodb://root:1234@127.0.0.1:27017/', { useUnifiedTopology: true });
};
