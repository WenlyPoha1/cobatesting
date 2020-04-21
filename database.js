var mysql = require("mysql");
require("dotenv").config();
var pool = mysql.createPool({
    host : process.env.DB_HOST,
    database : process.env.DB_NAME,
    user : process.env.DB_USER,
    password : process.env.DB_PASS,
    port : process.env.DB_PORT
});

function getConnection()
{
    return new Promise(function(resolve, reject){
        pool.getConnection((err, conn)=> {
            if(err){
                reject(err);
            }
            else{
                resolve(conn);
            }
        });
    });
}

function executeQuery(conn, query,params){
    return new Promise((resolve, reject)=>{
        conn.query(query, params, (err, result)=>{
            if(err) {
                reject(err);
            }
            else{
                resolve(result);
            }
        })
    });
}

module.exports = {
    getConnection:getConnection,
    executeQuery:executeQuery,
}
