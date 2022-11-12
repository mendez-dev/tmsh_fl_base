import 'dart:io';

// Importaciones de terceros
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// Importaciones propias
import '../../database/tbl_permission.dart';
import '../../database/tbl_user.dart';
import '../../database/tbl_user_group.dart';
import '../../database/tbl_user_group_permission.dart';
import '../../utils/logger.dart';

class DatabaseRepository {
  /// Almacenar la instancia de nuestra base de datos SQLite
  Database? db;
  final int _version;

  DatabaseRepository({int version = 1}) : _version = version;

  List<String> boolsFields = ['is_active', 'not_synchronized'];

  /// Se encarga de inicializar la creación de la base de datos
  Future<void> initDB() async {
    if (db != null) {
      // Si ya existe una instancia de la base de datos la reasignamos
      db = db;
    } else {
      // Si no existe creamos una nueva base de datos

      // Obtenemos el directorio de la base de datos
      Directory? documentsDirectory;
      await getExternalStorageDirectories()
          .then((value) => documentsDirectory = value!.first);
      final path = join(documentsDirectory!.path, 'dbmy_$_version.db');

      logger.i("PATH DE BASE DE DATOS");
      logger.i(path);

      // Creamos la estructura de la base de datos
      db = await openDatabase(path, version: _version,
          onCreate: (Database db, int version) async {
        await createUserGroup(db);
        await createUser(db);
        await createPermission(db);
        await createUserGroupPermission(db);
      });
    }
  }

  /// Guarda un lote de datos en la base de datos local
  /// [table] : nombre de la tabla donde se guardaran los datos
  /// [data] : datos a guardar
  /// [batch] : lote a guardar
  Future<bool> saveBatch(
      {required String table,
      required List<dynamic> data,
      required int numberOfbatch}) async {
    bool saved = false;
    try {
      // Obtenemos el nombre de la llave primaria de la tabla
      final columns = await db!.rawQuery('PRAGMA table_info($table)');
      final columnNames = columns.map((c) => c['name']).toList();
      final String primaryKey = columnNames.first.toString();

      Batch batch = db!.batch();
      for (final item in data) {
        // Verificamos si el registro ya existe en la base de datos
        final exists = await db!.rawQuery(
            '''SELECT * FROM $table WHERE $primaryKey = '${item[primaryKey]}' ''');
        Map<String, dynamic> map = Map.from(item);

        // Si no existe lo agregamos a la base de datos
        if (exists.isEmpty) {
          batch.insert(table, map);
        } else {
          batch.update(table, map,
              where: '''$primaryKey = '${item[primaryKey]}' ''');
        }
      }
      await batch.commit();

      saved = true;
      logger.i('Lote $numberOfbatch de $table guardado');
    } catch (e) {
      logger.e('Error al guardar lote $numberOfbatch de $table');
      logger.e(e);
    }
    return saved;
  }

  /// Obtiene una lista de datos paginados
  /// [table] : nombre de la tabla donde se obtendrán los datos
  /// [page] : pagina a obtener
  /// [limit] : limite de registros a obtener
  Future<Map<String, dynamic>> getPaginated(
      {required String table,
      required int page,
      required int recordsPerPage}) async {
    List<Map<String, dynamic>> data = [];
    int pages = 0;
    try {
      // Calculamos las variables para la paginación
      final int offset = (page - 1) * recordsPerPage;
      final int limitValue = recordsPerPage;

      // Ejecutamos la consulta para obtener los datos
      final String query =
          '''SELECT * FROM $table ORDER BY created_at ASC LIMIT $limitValue OFFSET $offset''';
      data = await db!.rawQuery(query);

      if (data.isNotEmpty) {
        // Convertimos los datos a booleanos
        data = convertToBool(data);
      }

      // Calculamos el numero de paginas que hay
      int? count = Sqflite.firstIntValue(
          await db!.rawQuery("SELECT COUNT(*) FROM $table"));

      if (count != null) {
        pages = (count / recordsPerPage).ceil();
      }

      logger.i('Pagina $page de $table obtenida');
    } catch (e) {
      logger.e('Error al obtener pagina $page de $table');
      logger.e(e);
    }
    return <String, dynamic>{
      'data': data,
      'total_pages': pages,
      'current_page': page,
    };
  }

  // Obtiene el valor de la ultima actualización de la tabla
  Future<String?> getLastUpdateDate({required String table}) async {
    // Obtenemos el valor de la ultima actualización
    final String query =
        '''SELECT updated_at FROM $table ORDER BY strftime(updated_at) DESC LIMIT 1''';
    final List<Map<String, dynamic>> data = await db!.rawQuery(query);
    return data.isNotEmpty ? data.first['updated_at'] : null;
  }

  /// Obtener el id del grupo de usuarios super admin
  /// Ordena los registros de la tabla user_group en base al campo crated_at
  /// y obtiene el primer registro para retornar el campo id_user_group
  Future<String?> getSuperAdminGroupId() async {
    const String query =
        '''SELECT id_user_group FROM user_group ORDER BY created_at ASC LIMIT 1''';
    final List<Map<String, dynamic>> data = await db!.rawQuery(query);
    return data.isNotEmpty ? data.first['id_user_group'] : null;
  }

  List<Map<String, dynamic>> convertToBool(List<Map<String, dynamic>> data) {
    List<Map<String, dynamic>> newData = [];
    for (final item in data) {
      Map<String, dynamic> map = Map.from(item);
      for (final field in boolsFields) {
        if (map[field] != null) {
          map[field] = map[field] == 1 ? true : false;
        }
      }
      newData.add(map);
    }
    return newData;
  }
}
