import 'package:base/src/modules/async/bloc/download/download_bloc.dart';
import 'package:base/src/modules/async/components/download_info.dart';
import 'package:base/src/modules/async/components/download_no_data.dart';
import 'package:base/src/modules/async/components/download_success.dart';
import 'package:base/src/modules/async/components/get_download_info.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/download_error.dart';
import '../components/downloading.dart';

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
            return const GetDownloadInfo();
          } else if (state.state == 1) {
            return const DownloadInfo();
          } else if (state.state == 2) {
            return const Downloading();
          } else if (state.state == 3) {
            return const DownloadSuccess();
          } else if (state.state == 4) {
            return const DownloadNoData();
          } else {
            return const DownloadError();
          }
        },
      ),
    );
  }
}
