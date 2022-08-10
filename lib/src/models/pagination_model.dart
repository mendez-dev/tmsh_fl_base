import 'package:built_collection/built_collection.dart';

abstract class PaginationModel<T> {
  int get currentPage;
  int get totalPages;
  BuiltList<T> get data;
}
