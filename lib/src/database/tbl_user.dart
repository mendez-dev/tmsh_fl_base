import 'package:sqflite/sqflite.dart';

import '../utils/logger.dart';

Future<void> createUser(Database db) async {
  await db.execute('''
    CREATE TABLE user(
      id_user TEXT PRIMARY KEY,
      id_legacy TEXT,
      id_user_group TEXT,
      firstname TEXT,
      lastname TEXT,
      username TEXT,
      email TEXT,
      password_hash TEXT,
      picture TEXT,
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
  logger.i("TABLA USER CREADA");
}
