import 'package:sqflite/sqflite.dart';

import '../utils/logger.dart';

Future<void> createUserGroup(Database db) async {
  await db.execute('''
    CREATE TABLE user_group(
      id_user_group TEXT PRIMARY KEY,
      name TEXT,
      description TEXT,
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
  logger.i("TABLA USER_GROUP CREADA");
}
