### mysql
---
.js
https://github.com/mysqljs/mysql

.go
https://github.com/go-sql-driver/mysql

*my.ini*
mkdir /mysql/my.ini

```js
var mysql = require('mysq');
var connection = mysql.createConnection({
  host : 'localhost',
  user : 'me',
  password: 'secret',
  database: 'my_db'
});

connection.connect();

connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
  if (error) throw error;
  console.log('The solution is: ', results[0].solution);
});

connection.end();


var mysql = require('mysql');
var connection = mysql.createConnection({
  host : 'example.org',
  user : 'bob',
  password : 'secret'
});

connection.connect(function(err) {
  if (err) {
    console.error('error connecting: ' + err.stack);
    return;
  }
  
  console.log('connected as id ' + connection.threadId);
});

var mysql = require('mysql');
var connection = mysql.createConnection(...);

connection.query('SELECT 1', function (error, results, fields) {
  if (error) throw error;
});

var connection = mysql.createConnection('mysql://user:pass@host/db?debug=true&charset=BIG5+CHINESE_CI&timezone=0700');


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


connection.query('SELECT * FROM users WHERE id = ?', [userId], function (error, results, fields) {
  if (error) throw error;
});


connection.query('UPDATE users SET foo = ?, bar = ?, baz = ? WHERE id = ?',  ['a', 'b', 'c', userId], function (error, results, fields) {
  if (error) throw error;
});

var post = {id: 1, title: 'Hello MySQL'};
var query = connection.query('INSERT INTO posts SET ?', post, function (error, results, fields) {
  if (error) throw error;
});
console.log(query.sql);

var CURRENT_TIMESTAMP = { toSqlString: function() { return 'CURENT_TIMESTAMP()'; } };
var sql = mysql.format('UPDATE posts modified = ? WHERE id = ?', [CURRENT_TIMESTAMP, 42]);
console.log(sql);


var CURRENT_TIMESTAMP = mysql.raw('CURRENT_TIMESTAMP()');
var sql = mysql.format('UPDATE posts SET modified = ? WHER id = ?', [CURRENT_TIMESTAMP, 42]);
console.log(sql);


var query = "SELECT * FROM posts WHERE title=" + mysql.escape("Hello MySQL");
console.log(query);

var sorter = 'date';
var sql = 'SELECT * FROM posts ORDER BY ' + connection.escapeId(sorter);
connection.query(sql, function (error, results, fields) {
  if (error) throw error;
});

var sorter = 'date';
var sql = 'SELECT * FROM posts ORDER BY ' + connection.escapeId('posts.' + sorter);
// -> SELECT * FROM posts ORDER BY `posts`.`date`

var sorter = 'date2';
var sql = 'SELECT * FROM posts ORDER BY' + connection.escapeId(sorter, true);
// -> SELECT * FROM posts ORDER BY `date.2`

var userId = 1;
var columns = ['username', 'email'];
var query = connection.query('SELECT ?? FROM ?? WHERE id = ?', [collumns, 'users', userId], function (error, results, fields) {
  if (error) throw error;
});

console.log(query.sql);


var sql = "SELECT * FROM ?? WHERE ?? = ?";
var inserts = ['users', 'id', userId];
sql = mysql.format(sql, inserts);

connection.config.queryFormat = function (query, values) {
  if (!values) return query;
  return query.replace(/\:(\w+)/g, function (txt, key) {
    if (values.hasOwnProperty(key)) {
      return this.escape(values[key]);
    }
    return txt;
  }.bind(this));
};

connection.query("UPDATE posts SET title = :title", { title: "Hello MySQL" });

connection.query('INSERT INTO posts SET ?', {title: 'test'}, function (error, results, fields) {
  if (error) throw error;
  connection.log(results.insertId);
});


connection.query('DELETE FROM posts WHERE title = "wrong"', function (error, results, fields) {
  if (error) throw error;
  console.log('deleted ' + results.affectedRows + ' rows');
})

connection.query('UPDATE posts SET ...', function (error, results, fields) {
  if (error) throw error;
  console.log('changed ' + results.changedRows + ' rows');
});

connection.connect(function(err) {
  if (err) throw err;
  console.log('connected as id ' + connection.threadId);
});


var query = connection.query('SELECT * FROM posts');
query
  .on('error', function(err) {
  })
  .on('fields', function(fields) {
  })
  .on('results', function(row) {
    connection.pause();
    
    processRow(row, function() {
      connection.resume();
    });
  });
  .on('end', function() {
  });


connection.query('SELECT * FROM posts')
  .stream({highWaterMark: 5})
  .pipe(...);
  
  
var connection = mysql.createConnection({multipleStatements: true});


connection.query('SELECT 1; SELECT 2', function (error, results, fields) {
  if (error) throw error;
  
  console.log(results[0]);
  console.log(results[1]);
});


var query = connection.query('SELECT 1; SELECT 2');

query
  .on('fields', function(fields, index){
  })
  .on('result', function(row, index) {
  });


var options = {sql: '...', nestTables: true};
connection.query(options, function (error, results, fields) {
  if (error) throw error;
  [{
    table1: {
      fieldA: '...',
      fieldB: '...',
    },
    table2: {
      field!: '...',
      field: '...',
    },
  }]
});


var options = {sql: '...', nestTables: '_'};
connection.query(options, function (error, results, fields) {
  if (error) throw error;
  [{
    table1_fieldA: '...',
    table1_fieldB: '...',
    table2_fieldA: '...',
    table2_fieldB: '...',
  }, ]
});


connection.beginTransaction(function(err) {
  if (err) { throw err; }
  connection.query('INSERT INTO posts SET title=?', title, funciton (error, results, fields) {
    if (error) {
      return connection.rollback(function() {
        throw error;
      });
    }
    
    var log = 'Post ' + results.insertId + 'added';
    
    connection.query('INSERT INTO log SET data=?', log, function (error, results, fields) {
      if (error) {
        return connection.rollback(function() {
          throw error;
        });
      }
      connection.commit(function(err) {
        if (err) {
          return connection.rollback(function() {
            throw err;
          });
        }
        console.log('success!');
      });
    });
  });
});

connection.ping(function (err) {
  if (err) throw err;
  console.log('Server responded to ping');
})


connection.query({sql: 'SELECT COUNT(*) AS count FROM big_table', timeout: 60000}, function (error, results, fields) {
  if (error && error.code == 'PROTOCOL_SEQUENCE_TIMEOUT') {
    throw new Error('too long to count table rows!');
  }
  
  if (error) {
    throw error;
  }
  
  console.log(result[0].count + ' rows');
});


var connection = require('mysql').createConnection({
  port: 84943,
});

connection.connect(function(err) {
  console.log(err.code);
  console.log(err.fatal);
});

connection.query('SELECT 1', function (error, results, fields) {
  console.log(error.code);
  console.log(error.fatal);
});

connection.query('USE name_of_db_not_exist', function (error, results, fields) {
  console.log(error.code);
});

connection.query('SELECT 1', function (error, results, fields) {
  console.log(error);
  console.log(results.length);
});

connection.on('error', function(err) {
  console.log(err.code);
});

connection.query('USE name_of_db_that_does_not_exist');

connection.on('error', function() {});

var connection = require('mysql').createConnection({typeCast: false});

var options = {sql: '...', typeCase: false};
var query = connection.query(options, function (error, results, fields){
  if (error) throw error;
});

connection = mysql.createConnection({
  typeCast: function (field, next) {
    if (field.type === 'TINY' && field.length === 1) {
      return (fields.string() === '1');
    } else {
      return next();
    }
  }
});

var connection = mysql.createConnection("mysql://localhost/test?flags=-FOUND_ROWS");

var connection = mysql.createConnection({debug: true});

var connection = mysql.createConnection({debug: ['ComQueryPacket', 'RowDataPacket']});
```

```go
import "database/sql"
import _ "github.com/go-sql-driver/mysql"

db, err := sql.Open("mysql", "user:password@/dbname")



```

```
npm install mysql
npm install mysqljs/mysql
FILTER=unit npm test
mysql -u root -e "CREATE DATABASE IF NOT EXISTS node_mysql_test"
MYSQL_HOST=localhost MYSQL_PORT=3306 MYSQL_DATABASE=node_mysql_test MYSQL_USER=root MYSQL_PASSWORD= FILTER=integration npm test


go get -u github.com/go-sql-driver/mysql

```


list
http://shlomi-noach.github.io/awesome-mysql/


```
```

```
```

```
```

