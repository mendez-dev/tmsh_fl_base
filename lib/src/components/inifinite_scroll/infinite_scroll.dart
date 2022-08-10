import 'package:base/src/models/pagination_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InfiniteScroll<T extends PaginationModel<S>, S> extends StatefulWidget {
  const InfiniteScroll({Key? key, this.getData}) : super(key: key);

  final Future<T> Function()? getData;

  @override
  State<InfiniteScroll<T, S>> createState() => _InfiniteScrollState<T, S>();
}

class _InfiniteScrollState<T extends PaginationModel<S>, S>
    extends State<InfiniteScroll<T, S>> {
  final RefreshController _controller = RefreshController();

  int currentPage = 0;
  int totalPages = 0;

  BuiltList<S> data = BuiltList<S>();

  @override
  void initState() {
    if (widget.getData != null) {
      _getInitialData(widget.getData!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example")),
      body: SmartRefresher(
        controller: _controller,
        child: SingleChildScrollView(
          child: Column(
            children: data
                .map((i) => ListTile(
                      title: Text(i.toString()),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Future<BuiltList<S>?> _getInitialData(Future<T> Function() getData) async {
    final response = await getData();

    if (response.data.isNotEmpty) {
      setState(() {
        data = response.data;
      });
    }
  }
}
