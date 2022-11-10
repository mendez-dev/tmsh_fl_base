import 'package:built_collection/built_collection.dart';

/// Modelo de paginación
///
/// Clase abstracta que define la estructura para la paginación de datos
/// todo modelo que de datos paginados que se utilize en el widget personalizado
/// [smart refresh] debera extender esta clase para que el widget pueda interpretar
/// sus propiedades correctamente
abstract class PaginationModel<T> {
  /// Numero de pagina actual
  int get currentPage;

  /// Total de paginas disponibles
  int get totalPages;

  /// Listado de datos páginados
  BuiltList<T> get data;
}
