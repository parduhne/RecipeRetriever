'use strict';

const knex = require('knex')({
  client: 'postgresql',
  connection: {
    debug: 'true',
    host: process.env.DB_HOST,
    port: 5432,
    user: process.env.DB_USER,
    password: process.env.DB_PWD,
    database: process.env.DB_NAME
  }
});

function logHeartbeat() {
  knex
    .select('*')
    .from('pg_catalog.pg_tables')
    .asCallback(function(err, result) {
      console.log("Hey");
    });
}

function testDb(){
  knex.schema.createTable('users', (table) => {
    table.increments('id')
    table.string('name')
    table.integer('age')
  })
  .then(function(){
    return knex("users").insert([
      {name: "Abe", age: 20},
      {name: "Boris", age: 22},
      {name: "Coolio", age: 100}])
  })
  .then(function(){
    knex("users").then(rows => console.log(rows))
  });
}

testDb();