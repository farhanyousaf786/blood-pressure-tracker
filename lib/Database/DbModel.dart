import 'package:bloodpressure/Database/BpModel.dart';
import 'package:sqflite/sqflite.dart'; // sqflite for database
import 'package:path/path.dart'; // the path package

class DatabaseConnect {
  Database? _database;

  // create a getter and open a connection to database
  Future<Database> get database async {
    // this is the location of our database in device. ex - data/data/....
    final dbpath = await getDatabasesPath();
    // this is the name of our database.
    const dbname = 'bpData.db';
    // this joins the dbpath and dbname and creates a full path for database.
    // ex - data/data/bpData.db
    final path = join(dbpath, dbname);

    // open the connection
    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    // we will create the _createDB function separately

    return _database!;
  }

  // the _create db function
  // this creates Tables in our database
  Future<void> _createDB(Database db, int version) async {
    // make sure the columns we create in our table match the todo_model field.
    await db.execute('''
      CREATE TABLE bpData(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sys TEXT,
        dia TEXT,
        pulse TEXT,
        creationDate TEXT
      )
    ''');
  }

  // function to add data into our database
  Future<void> insertBpRecord(BpInfo bpInfo) async {
    // get the connection to database
    final db = await database;
    // insert the bpData
    await db.insert(
      'bpData', // the name of our table
      bpInfo.toMap(), // the function we created in our todo_model
      conflictAlgorithm:
      ConflictAlgorithm.replace, // this will replace the duplicate entry
    );
  }

  // function to delete a  bpData from our database
  Future<void> deleteBpRecord(BpInfo bpInfo) async {
    final db = await database;
    // delete the bpData from database based on its id.
    await db.delete(
      'bpData',
      where: 'id == ?', // this condition will check for id in bpData list
      whereArgs: [bpInfo.id],
    );
  }

  // function to fetch all the bpData data from our database
  Future<List<BpInfo>> getBpRecord() async {
    final db = await database;
    // query the database and save the bpData as list of maps
    List<Map<String, dynamic>> items = await db.query(
      'bpData',
      orderBy: 'id DESC',
    ); // this will order the list by id in descending order.
    // so the latest bpData will be displayed on top.

    // now convert the items from list of maps to list of bpData

    return List.generate(
      items.length,
          (i) => BpInfo(
        id: items[i]['id'],
        sys: items[i]['sys'],
        dia: items[i]['dia'],
        pulse: items[i]['pulse'],
        creationDate: DateTime.parse(items[i][
        'creationDate']), // this is in Text format right now. let's convert it to dateTime format

      ),
    );
  }

  // ------- not included in video--------

  // function for updating a bpData in todoList
  Future<void> updateBpRecord(int id, String sys) async {
    final db = await database;

    await db.update(
      'bpData', // table name
      {
        //
        'sys': sys, // data we have to update
      }, //
      where: 'id == ?', // which Row we have to update
      whereArgs: [id],
    );
  }
}