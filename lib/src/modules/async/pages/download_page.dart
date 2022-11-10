import 'package:base/src/modules/async/bloc/download/download_bloc.dart';
import 'package:base/src/modules/async/widgets/download_info_widget.dart';
import 'package:base/src/modules/async/widgets/download_no_data_widget.dart';
import 'package:base/src/modules/async/widgets/download_success_widget.dart';
import 'package:base/src/modules/async/widgets/get_download_info_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/download_error_widget.dart';
import '../widgets/downloading_widget.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  void initState() {
    BlocProvider.of<DownloadBloc>(context).add(const DownloadInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Descarga de datos"),
      ),
      body: BlocConsumer<DownloadBloc, DownloadState>(
        listener: (BuildContext context, DownloadState state) {},
        builder: (BuildContext context, DownloadState state) {
          if (state.state == 0) {
            return const GetDownloadInfoWidget();
          } else if (state.state == 1) {
            return const DownloadInfoWidget();
          } else if (state.state == 2) {
            return const DownloadingWidget();
          } else if (state.state == 3) {
            return const DownloadSuccessWidget();
          } else if (state.state == 4) {
            return const DownloadNoDataWidget();
          } else {
            return const DownloadErrorWidget();
          }
        },
      ),
    );
  }
}
