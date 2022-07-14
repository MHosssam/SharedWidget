import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _db;
  final String tableName = 'tableName';

  // service columns
  final String columnID = 'columnID';
  final String title = 'title';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDB();
      return _db!;
    }
  }

  initDB() async {
    final dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'cart.db');
    var myOwenDB = await openDatabase(path, version: 2, onCreate: _onCreate);
    return myOwenDB;
  }

  void _onCreate(Database db, int newVersion) async {
    var serviceSql = '''
CREATE TABLE "$tableName"(
$columnID INTEGER PRIMARY KEY ,
$title TEXT 
)
''';
    await db.execute(serviceSql);
  }

  // save item
  Future<int> saveItem({required ServiceDB service}) async {
    var dbUser = await db;
    int result = await dbUser.insert(tableName, service.toMap());
    return result;
  }

  //get all
  Future<List<ServiceDB>> getAllData() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query(
      tableName,
      columns: [
        columnID,
        title,
      ],
    );
    List<ServiceDB> allServices = [];
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        allServices.add(ServiceDB.fromMap(maps[i]));
      }
    }
    return allServices;
  }

  //get count
  Future<int?> getServiceCount() async {
    var dbClient = await db;
    var sql = "SELECT COUNT(*) FROM $tableName";
    return Sqflite.firstIntValue(await dbClient.rawQuery(sql));
  }

  // get item
  Future<ServiceDB?> getItemById({required int serviceId}) async {
    var dbClient = await db;
    var sql = "SELECT * FROM $tableName WHERE $columnID = $serviceId";
    var result = await dbClient.rawQuery(sql);
    if (result.isEmpty) {
      return null;
    }
    return ServiceDB.fromMap(result.first);
  }

  // check id exist
  Future<bool> uidServiceExists({required int myServiceId}) async {
    var result = await _db?.rawQuery(
      'SELECT EXISTS(SELECT 1 FROM $tableName WHERE $columnID = $myServiceId)',
    );
    int exists = Sqflite.firstIntValue(result!)!;
    return exists == 1;
  }

  // delete item
  Future<int> deleteItemById({required int serviceId}) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableName,
      where: '$columnID = ?',
      whereArgs: [serviceId],
    );
  }

  // delete all
  deleteAllDataBase() async {
    var dbClient = await db;
    await dbClient.delete(tableName);
  }

  // update item
  Future<int> updateService({
    required int serviceId,
    required ServiceDB service,
  }) async {
    var dbClient = await db;
    return await dbClient.update(tableName, service.toMap(),
        where: "$columnID = ? ", whereArgs: [serviceId]);
  }

  // close db
  Future<void> closeDb() async {
    final _closeDb = await db;
    return await _closeDb.close();
  }
}
