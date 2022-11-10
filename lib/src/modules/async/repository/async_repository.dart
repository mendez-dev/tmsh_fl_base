import 'package:base/src/repositories/database_repository/database_repository.dart';
import 'package:base/src/repositories/network/network_repository.dart';

import '../../../utils/logger.dart';

class AsyncRepository {
  final NetworkRepository _network;
  final DatabaseRepository _database;

  AsyncRepository({
    required NetworkRepository network,
    required DatabaseRepository database,
  })  : _network = network,
        _database = database;

  // Obtiene el listado de recursos/tablas que se descargaran
  Future<List<String>> getResourcesList() async {
    List<String> resources = [];
    try {
      final response = await _network.instance.get('/v1/sync/resources');
      if (response.data['code'] == 200) {
        resources =
            response.data['data'].map<String>((e) => e.toString()).toList();
      }
    } catch (e) {
      logger.e(e);
    }

    return resources;
  }

  /// Obtiene la ultima fecha de actualización de todas las tablas
  Future<String?> getLastUpdateDate({required List<String> tables}) async {
    // Obtieme el valor del campo updated_at por cada tabla del listado de tablas
    // y retorna el valor mas reciente

    String? lastUpdate;

    for (var table in tables) {
      // Obtiene el valor del campo updated_at de la tabla
      String? updatedAt = await _database.getLastUpdateDate(table: table);

      // Si el valor de updatedAt es diferente de null y el valor de lastUpdate
      // es null, entonces se asigna el valor de updatedAt a lastUpdate
      if (updatedAt != null && lastUpdate == null) {
        lastUpdate = updatedAt;
      }

      // Si el valor de updatedAt es diferente de null y el valor de lastUpdate
      // es diferente de null, entonces se compara el valor de updatedAt con el
      // valor de lastUpdate, si el valor de updatedAt es mayor que el valor de
      // lastUpdate, entonces se asigna el valor de updatedAt a lastUpdate
      if (updatedAt != null && lastUpdate != null) {
        if (updatedAt.compareTo(lastUpdate!) > 0) {
          lastUpdate = updatedAt;
        }
      }
    }

    return lastUpdate;
  }

  /// Obtiene el numero de lotes de el recurso
  Future<int> getNumberOfBatches(
      {required String resource,
      required int recordsPerBatch,
      String? lastUpdate}) async {
    int batches = 0;
    try {
      final response = await _network.instance.get("/v1/sync/batchs",
          queryParameters: {
            "resource": resource,
            "limit": recordsPerBatch,
            "last_update": lastUpdate
          });

      if (response.data['code'] == 200) {
        batches = int.parse(response.data['data']['total_batches'].toString());
      }
    } catch (e) {
      logger.e(e);
    }

    return batches;
  }

  /// Descarga y guarda un lote de datos en la base de datos local
  /// [resource] : recurso a descargar
  /// [batch] : lote a descargar
  Future<bool> downloadBatch(
      {required String resource,
      required int batch,
      required int recordsPerBatch,
      String? lastUpdate}) async {
    bool downloaded = false;
    try {
      final response =
          await _network.instance.get("/v1/sync/download", queryParameters: {
        "resource": resource,
        "batch": batch,
        "limit": recordsPerBatch,
        "last_update": lastUpdate
      });

      logger.i(
          "/v1/$resource/$batch/$recordsPerBatch - ${response.data['code']}");

      if (response.data['code'] == 200) {
        downloaded = await _database.saveBatch(
            table: resource,
            numberOfbatch: batch,
            data: List.from(response.data['data']));
      }
    } catch (e) {
      logger.e('Error al descargar lote $batch de $resource');
      logger.e(e);
    }
    return downloaded;
  }
}
