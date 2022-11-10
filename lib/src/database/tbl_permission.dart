import 'package:sqflite/sqflite.dart';
import '../utils/logger.dart';

Future<void> createPermission(Database db) async {
  await db.execute('''
    CREATE TABLE permission(
      id_permission TEXT PRIMARY KEY,
      name TEXT,
      label TEXT,
      group_tag TEXT,
      description TEXT,
      icon TEXT,
      depends_on TEXT,
      type TEXT,
      is_active INTEGER,
      created_by TEXT,
      created_at TEXT,
      updated_by TEXT,
      updated_at TEXT,
      deleted_by TEXT,
      deleted_at TEXT,
      not_synchronized INTEGER
    ) 
  ''');
  logger.i("TABLA PERMISSION CREADA");
}