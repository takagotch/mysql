### mysql
---
.js
https://github.com/mysqljs/mysql

.go
https://github.com/go-sql-driver/mysql

*my.ini*
mkdir /mysql/my.ini

```js
var connection = mysql.createConnection({
  host : 'localhost',
  ssl : {
    ca : fs.readFileSync(__dirname + '/mysql-ca.crt')
  }
});

var connection = mysql.createConnection({
  host : 'localhost',
  ssl : {
    rejectUnauthorized: false
  }
});

connection.end(function(err) {
});

connection.destroy();

var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host : 'example.org',
  user : 'tky',
  password : 'secret',
  database : 'my_db'
});

pool.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
  if (error) throw error;
  console.log('The solution is: ', results[0].solution);
});

var mysql = require('mysql');
var pool = mysql.createPool(...);

pool.getConnection(function(err, connection) {
  if (err) throw err;
  
  connection.query('SELECT something FROM sometable', function (error, results, fields) {
    connection.release();
    
    if (error) throw error;
  });
});

pool.on('acquire', function (connection) {
  console.log('Connection %d acquired', connection.threadId);
});

pool.on('connection', function (connection) {
  connection.query('SET SESSION auto_increment_increment=1')
});

pool.on('enqueue', function () {
  console.log('Waiting for available connection slot');
});

pool.on('release', function (connection) {
  console.log('Connection %d released', connection.threadId);
});

pool.end(function (err) {
});

var poolCluster = mysql.createPoolCluster();

poolCluster.add(config);
poolCluster.add('MATER', slaveConfing);
poolCluster.add('SLAVE1', slave1Config);
poolCluster.add('SLAVE2', slave2Config);

poolCluster.remove('SLAVE2');
poolCluster.remove('SLAVE*');

poolCluster.getConnection(function (err, connection) {});

poolCluster.getConnection('MASTER', function (err, connection) {});

poolCluster.on('remove', function (nodeId) {
  console.log('REMOVED NODE : ' + nodeId);
});

poolCluster.getConnection('SLAVE*', 'ORDER', function (err, connection) {});

poolCluster.getConnection(/^SLAVE[12]$/, function (err, connection) {});

poolCluster.of('*').getConnection(function (err, connection) {});

var pool = poolCluster.of('SLAVE*', 'RANDOM');
pool.getConnection(function (err, connection) {});
pool.getConnection(function (err, connection) {});
pool.query(function (error, results, fields) {});

poolCluster.end(function (err) {
});

var clusterConfig = {
  removeNodeErrorCount: 1,
  defaultSelector: 'ORDER'
};

var poolCluster = mysql.createPoolCluster(clusterConfig);


connection.changeUser({user : 'john'}, function(err) {
  if (err) throw err;
});

connection.query('SELECT * FROM `books` WHERE `author` = "DAvid"', function (error, results, fields) {
});

connection.query({
  sql: 'SELECT * FROM `books` WHERE `author` = ?',
  timeout: 40000,
  values: ['David']
}, function (error, results, fields) {
});

connection.query({
  'SELECT * FROM `books` WHERE `author` = ?',
  'Tky',
  function (error, results, fields) {
  }
);

var userId = 'some user provided value';
var sql = 'SELECT * FROM WHERE id = ' + connection.escape(userId);
connection.query(sql, function (error, redults, fields) {
  if (error) throw error;
});


















```

```go

```

```
```


list
http://shlomi-noach.github.io/awesome-mysql/


```
```

```
```

```
```

