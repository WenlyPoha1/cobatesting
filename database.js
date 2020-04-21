var mysql = require("mysql");

var pool = mysql.createPool({
    host : "localhost",
    database : "6666",
    user : "root",
    password : ""
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