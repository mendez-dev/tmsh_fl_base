import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../bloc/download/download_bloc.dart';

// Crear un stateless widget con un container que tenga una animación lottie centrada en el widget
class DownloadingWidget extends StatelessWidget {
  const DownloadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadBloc, DownloadState>(
      builder: (BuildContext context, DownloadState state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 225,
                decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor),
                width: double.infinity,
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Lottie.asset('assets/lotties/async.json'))),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Descargando datos",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Descargando datos por favor espere...",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: LinearPercentIndicator(
                animateFromLastPercent: true,
                animation: true,
                barRadius: const Radius.circular(4),
                lineHeight: 35.0,
                percent: state.progress / 100,
                center: Text(
                  "${state.progress} %",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.white),
                ),
                padding: const EdgeInsets.all(0),
                backgroundColor: Colors.grey,
                progressColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
