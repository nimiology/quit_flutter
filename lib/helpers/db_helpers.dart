import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'places5.db'),
        onCreate: (db, version) {
      db.execute(
          "CREATE TABLE quit_period(id TEXT PRIMARY KEY, title TEXT NOT NULL, created_date INTEGER NOT NULL)");
      db.execute(" CREATE TABLE doing(id TEXT PRIMARY KEY, quit_period_id INTEGER NOT NULL, why TEXT, created_date INTEGER NOT NULL,  FOREIGN KEY (quit_period_id) REFERENCES quit_period (id) ON DELETE CASCADE ON UPDATE NO ACTION)");
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future delete(
    String tableName,
    String where,
  ) async {
    final db = await DBHelper.database();
    await db.rawDelete(
      'DELETE FROM $tableName WHERE id = ?',
      [where],
    );
  }
}
