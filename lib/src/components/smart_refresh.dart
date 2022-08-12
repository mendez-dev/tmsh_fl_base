import 'package:base/src/models/pagination_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Smart refresh
///
/// Hace uso del SmartRefresher del paquete pull_to_refresh para crear un widget
/// que sea capas de consumir la api CI4 de forma automatica indicando el modelo
/// de la paginacion de datos (por ejemplo UserPagination) el cual debe extender
/// a PaginationModel, indicando el modelo indiviudal (por ejemplo UserModel) y
/// tambien indicando la funcion que retornara los datos la cual debe cumplir los
/// criterios que aqui se indiquen.
class SmartRefresh<T extends PaginationModel<S>, S> extends StatefulWidget {
  const SmartRefresh(
      {Key? key,
      required this.getData,
      required this.listViewBuilder,
      this.title = "",
      this.recordsPerPage = 10})
      : super(key: key);

  /// Obtener datos
  ///
  /// Funcion de la cual se consumiran los datos para mostrar en el widget
  /// debe retornar un Future del tipo de dato que se mostrara, ademas debe
  /// recibir los siguientes parametros todos opcionales
  ///
  /// * [int page] => el numero de la pagina que se esta solicitando
  /// * [int recordsPerPage] => el numero de registros que se solicitan
  final Future<T> Function({int page, int recordsPerPage, String query})
      getData;

  /// Constructor de vista de tipo lista
  ///
  /// Función que debe retornar el widget que se mostrará en la lista
  final Widget Function(S item) listViewBuilder;

  /// Titulo del AppBar
  final String title;

  /// Numero de registros que se mostrara por petición
  final int recordsPerPage;

  @override
  State<SmartRefresh<T, S>> createState() => _SmartRefreshState<T, S>();
}

class _SmartRefreshState<T extends PaginationModel<S>, S>
    extends State<SmartRefresh<T, S>> {
  final RefreshController _controller = RefreshController();

  /// Numero de pagina actual
  int currentPage = 0;

  /// Total de paginas
  int totalPages = 0;

  /// Indica si el widget esta cargando
  bool loading = false;

  /// Almacenara los registros obtenidos
  BuiltList<S> data = BuiltList<S>();

  @override
  void initState() {
    /// Obtenemos los registros iniciales
    _getInitialData(widget.getData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => _search(widget.getData),
              icon: const Icon(FontAwesomeIcons.search))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SmartRefresher(
              enablePullUp: true,
              onLoading: () => _loadMoreData(widget.getData),
              onRefresh: () => _refreshData(widget.getData),
              controller: _controller,
              child: loading
                  ? loadingWidget()
                  : SingleChildScrollView(
                      child: Column(
                        children: data
                            .map(
                              (i) => widget.listViewBuilder(i),
                            )
                            .toList(),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  /// Obtiene los primeros registros al momento de crear el widget
  Future<void> _getInitialData(
      Future<T> Function({int page, int recordsPerPage}) getData) async {
    // Indica que esta cargando los datos
    setState(() => loading = true);

    // Obtenemos los datos
    final response = await getData();

    if (response.data.isNotEmpty) {
      setState(() {
        data = response.data;
        currentPage = response.currentPage;
        totalPages = response.totalPages;
      });
    }

    // Indicamos que ya no se estan cargando datos
    setState(() => loading = false);
  }

  /// Carga mas datos al momento de llegar al final de la lista
  Future<void> _loadMoreData(
      Future<T> Function({int page, int recordsPerPage}) getData) async {
    // Solo se cargan datos si no se a alcansado el total de paginas mostradas
    if (currentPage + 1 <= totalPages) {
      final response = await getData(page: currentPage + 1);

      if (response.data.isNotEmpty) {
        setState(() {
          // BuildList
          ListBuilder<S> temp = data.toBuilder();
          temp.addAll(response.data.toBuiltList());
          data = temp.build();
          currentPage = response.currentPage;
          totalPages = response.totalPages;
        });
      }
    }

    if (currentPage >= totalPages) {
      // Si ya se alcanzo el total de paginas mostradas se indica que no hay
      // mas datos
      _controller.loadNoData();
    }
  }

  /// Refresca la pagina al hacer pull to refresh
  Future<void> _refreshData(
      Future<T> Function({int page, int recordsPerPage}) getData) async {
    final response = await getData();

    if (response.data.isNotEmpty) {
      setState(() {
        data = response.data;
        currentPage = response.currentPage;
        totalPages = response.totalPages;
      });
    }

    _controller.refreshCompleted();
    _controller.loadComplete();
  }

  /// Retorna el widget de carga por defecto
  Widget loadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  /// Busqueda
  void _search(
      Future<T> Function({int page, int recordsPerPage, String query})
          getData) {
    showSearch(context: context, delegate: SearchData<T, S>(getData, widget));
  }
}

class SearchData<T extends PaginationModel<S>, S> extends SearchDelegate {
  SearchData(this.getData, this.smartRefresh);

  final Future<T> Function({int page, int recordsPerPage, String query})
      getData;
  final SmartRefresh<T, S> smartRefresh;

  BuiltList<S> data = BuiltList<S>();

  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      primary: false,
      itemCount: data.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        return smartRefresh.listViewBuilder(data[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder<T>(
        future: getData(query: query.trim()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final T response = snapshot.data;
            data = response.data;

            if (data.isNotEmpty) {
              return ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                itemCount: data.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
                itemBuilder: (context, index) {
                  return smartRefresh.listViewBuilder(data[index]);
                },
              );
            } else {
              return const Center(
                child: Text("No se encontraron registros"),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container();
        });
  }
}
