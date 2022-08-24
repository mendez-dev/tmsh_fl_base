import 'package:base/src/repositories/network/network_repository.dart';
import 'package:base/src/utils/logger.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepository {
  final Database _database;
  final NetworkRepository _network;

  final int recordsPerRequest = 1000;

  DatabaseRepository(
      {required Database database, required NetworkRepository network})
      : _database = database,
        _network = network;
}
