import 'package:sqflite/sqflite.dart';
import '../utils/logger.dart';

Future<void> createUserGroupPermission(Database db) async {
  await db.execute('''
    CREATE TABLE user_group_permission(
      id_user_group_permission TEXT PRIMARY KEY,
      id_user_group TEXT,
      id_permission TEXT,
      created_by TEXT,
      created_at TEXT,
      updated_by TEXT,
      updated_at TEXT,
      deleted_by TEXT,
      deleted_at TEXT,
      not_synchronized INTEGER
    ) 
  ''');
  logger.i("TABLA USER_GROUP_PERMISSION CREADA");
}