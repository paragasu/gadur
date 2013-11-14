.pragma library

var _db;

function openDB() {
    _db = openDatabaseSync("gadurdb","1.0","Gadur Database",1000000);
}


function readExpenses(model)
{
    model.clear();
    _db.readTransaction(
                function(tx){
                    var rs = tx.executeSql("SELECT * FROM expenses WHERE date BETWEEN '2013-05-01' AND '2015-10-01' ORDER BY date DESC, id DESC");
                    for (var i=0; i< rs.rows.length; i++) {
                        model.append(rs.rows.item(i));
                    }
                }
                );
}


function readCategory(model)
{
    var db = openDatabaseSync("gadurdb","1.0","Gadur Database",1000000);
    model.clear()
    db.readTransaction(
                function(tx){
                    var rs = tx.executeSql("SELECT * FROM category ORDER BY name");
                    for (var i=0; i< rs.rows.length; i++) {
                        model.append(rs.rows.item(i));
                    }
                    }

                    )
}


function createExpenses(item)
{
    var db = openDatabaseSync("gadurdb","1.0","Gadur Database",1000000);
    db.transaction(
                function(tx){
                    tx.executeSql("INSERT INTO expenses(cat_id, name, info, amount, date) VALUES(?,?,?,?,?)", [item.catid, item.name, item.info, item.amount, item.date]);
                    }
                    )
}
