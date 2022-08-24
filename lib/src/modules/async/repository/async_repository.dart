import 'package:base/src/database/database.dart';
import 'package:base/src/repositories/network/network_repository.dart';

import '../../../utils/logger.dart';

class AsyncRepository {
  final NetworkRepository _network;
  final DataBase _database = DataBase();

  AsyncRepository({
    required NetworkRepository network,
  }) : _network = network;

  /// Obtiene el numero de lotes de el recurso
  Future<int> getNumberOfBatches(
      {required String resource, required int recordsPerBatch}) async {
    int batches = 0;
    try {
      final response =
          await _network.instance.get("/v1/batch/$resource/$recordsPerBatch");

      if (response.data['code'] == 200) {
        batches = int.parse(response.data['data']['batches'].toString());
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
      required int recordsPerBatch}) async {
    bool downloaded = false;
    try {
      final response =
          await _network.instance.get("/v1/$resource/$batch/$recordsPerBatch");

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
