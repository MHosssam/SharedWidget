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
    final myOwenDB = await openDatabase(path, version: 2, onCreate: _onCreate);
    return myOwenDB;
  }

  void _onCreate(Database db, int newVersion) async {
    final batch = db.batch();
    final serviceSql = '''
                      CREATE TABLE "$tableName"(
                          $columnID INTEGER PRIMARY KEY ,
                          $title TEXT 
                      )
''';
    batch.execute(serviceSql);

    batch.commit();
  }

  // save item
  Future<int> saveItem({required ServiceDB service}) async {
    final _saveDb = await db;
    int result = await _saveDb.insert(tableName, service.toMap());
    return result;
  }

  //get all
  Future<List<ServiceDB>> getAllData() async {
    final _getDb = await db;
    List<Map<String, dynamic>> maps = await _getDb.query(
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
    final _getDb = await db;
    final sql = "SELECT COUNT(*) FROM $tableName";
    return Sqflite.firstIntValue(await _getDb.rawQuery(sql));
  }

  // get item
  Future<ServiceDB?> getItemById({required int serviceId}) async {
    final _getDb = await db;
    final sql = "SELECT * FROM $tableName WHERE $columnID = $serviceId";
    final result = await _getDb.rawQuery(sql);
    if (result.isEmpty) {
      return null;
    }
    return ServiceDB.fromMap(result.first);
  }

  // check id exist
  Future<bool> uidServiceExists({required int myServiceId}) async {
    final result = await _db?.rawQuery(
      'SELECT EXISTS(SELECT 1 FROM $tableName WHERE $columnID = $myServiceId)',
    );
    int exists = Sqflite.firstIntValue(result!)!;
    return exists == 1;
  }

  // delete item
  Future<int> deleteItemById({required int serviceId}) async {
    final _deleteDb = await db;
    return await _deleteDb.delete(
      tableName,
      where: '$columnID = ?',
      whereArgs: [serviceId],
    );
  }

  // delete all
  Future<void> deleteAllDataBase() async {
    final deleteAllDb = await db;
    await deleteAllDb.delete(tableName);
  }

  // update item
  Future<int> updateItem({
    required int serviceId,
    required ServiceDB service,
  }) async {
    final _updateDb = await db;
    return await _updateDb.update(tableName, service.toMap(),
        where: "$columnID = ? ", whereArgs: [serviceId]);
  }

  // close db
  Future<void> closeDb() async {
    final _closeDb = await db;
    return await _closeDb.close();
  }
}
