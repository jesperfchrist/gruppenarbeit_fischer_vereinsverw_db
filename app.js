const express = require("express");
const dotenv = require("dotenv");
const mysql = require('mysql');
const path = require("path");

const app = express();

app.engine(".html", require("ejs").__express);
app.set('views', path.join(__dirname, 'views'));
app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'html');

dotenv.config();

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: process.env.DB_ROOT_PSWD,
    database: 'beehive'
});


app.get("/", (req, res) => {
    connection.connect((err) => {
        if (err) throw err;
        console.log('Connected to MySQL Server!');
    });
    let sportarten;
    let sql_query = `SHOW TABLES;`;
    connection.query(sql_query, (err, rows) => {
        if (err) throw err;
        console.log('The data from users table are: \n', rows);
        sportarten = rows;
    });
    res.render('sportarten', {
        sportarten: sportarten,
        title: 'sportarten',
        header: 'some sportarten'
    });
    connection.end();
});

app.get("/sportarten", (req, res) => {
    connection.connect((err) => {
        if (err) throw err;
        console.log('Connected to MySQL Server!');
    });
    let sportarten;
    let sql_query = `SELECT * FROM sportarten;`;
    connection.query(sql_query, (err, rows) => {
        if (err) throw err;
        res.render('sportarten', {
            sportarten: rows,
            title: 'sportarten',
            header: 'some sportarten'
        });
    });
    connection.end();
});

app.listen(3000, () => {
    console.log('Server is running at port 3000');
});