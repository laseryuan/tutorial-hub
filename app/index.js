const hapi = require('hapi');
const mongoose = require('mongoose');
const Painting = require('./models/Painting');

const mongo_url = 'mongodb://' +
  process.env.MONGODB_USER + ':' +
  process.env.MONGODB_PASSWORD + '@' +
  process.env.MONGODB_DS + '.mlab.com:' +
  process.env.MONGODB_PORT + '/' +
  process.env.MONGODB_DB_NAME;

mongoose.connect(mongo_url, { useNewUrlParser: true  });

mongoose.connection.once('open', () => {
  console.log('connected to database');
});

const server = hapi.server({
  port: 4000,
  host: 'localhost'
});

const init = async () => {
  server.route([
    {
      method: 'GET',
      path: '/',
      handler: (req, reply) => {
        return '<h1>My modern api</h1>';
      }
    },
    {
      method: 'GET',
      path: '/api/v1/paintings',
      handler: (req, reply) => {
        return Painting.find();
      }
    },
    {
      method: 'POST',
      path: '/api/v1/paintings',
      handler: (req, reply) => {
        const { name, url, technique } = req.payload;
        const painting = new Painting({
          name,
          url,
          technique
        });

        return painting.save();
      }
    }
  ]);

  await server.start();
  console.log(`Server running at: ${server.info.uri}`);
};

init();
