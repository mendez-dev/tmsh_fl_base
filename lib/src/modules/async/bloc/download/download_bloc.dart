import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/logger.dart';
import '../../repository/async_repository.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  // instancia de AsyncRepository
  final AsyncRepository _asyncRepository;

  DownloadBloc({required AsyncRepository asyncRepository})
      : _asyncRepository = asyncRepository,
        super(DownloadState.initial()) {
    on<DownloadEvent>((event, emit) {});
    on<DownloadInitialEvent>(_onDownloadInitialEventToState);
    on<StartDownloadEvent>(_onStartDownloadEventToState);
  }

  void _onDownloadInitialEventToState(
      DownloadInitialEvent event, Emitter<DownloadState> emit) async {
    // Estado inicial
    emit(DownloadState.initial());

    // Verificar si la lista de recursos contiene elementos, si es asi recorrer
    // la lista y obtener la cantidad de lotes a descargar
    if (event.resources.isNotEmpty) {
      int batches = 0;
      List<Map<String, dynamic>> downloads = [];
      for (String resource in event.resources) {
        int response = await _asyncRepository.getNumberOfBatches(
          resource: resource,
          recordsPerBatch: state.recordsPerBatch,
        );

        // Almacenamos la información en la lista de descargas
        Map<String, dynamic> resourceDownloadInfo = {
          'resource': resource,
          'batches': response,
          'errors': <int>[],
          'downloaded': 0
        };

        downloads.add(resourceDownloadInfo);
        batches += response;
      }

      // Calculamos el numero total de lotes a descargar
      int totalBatches = batches * event.resources.length;

      emit(state.copyWith(
          state: 1,
          batches: batches,
          resources: event.resources,
          downloads: downloads));
      logger.v(state.downloads);
    }
  }

  void _onStartDownloadEventToState(
      StartDownloadEvent event, Emitter<DownloadState> emit) async {
    // Indicamos que se esta descargando
    emit(state.copyWith(state: 2));

    // Recorremos la lista de descargas y descargamos los lotes
    for (Map<String, dynamic> download in state.downloads) {
      for (int i = 1; i <= download['batches']; i++) {
        bool response = await _asyncRepository.downloadBatch(
          resource: download['resource'],
          batch: i,
          recordsPerBatch: state.recordsPerBatch,
        );
        if (response) {
          download['downloaded']++;
          // Sumamos un lote descargado con éxito
          emit(state.copyWith(downloadedBatches: state.downloadedBatches + 1));
        } else {
          download['errors'].add(i);
        }

        // Calculamos el progreso de la descarga
        double progress = (state.downloadedBatches) / state.batches * 100;
        emit(state.copyWith(progress: progress));
      }
    }

    // Si hubo error al descargar alguno de los lotes intentamos descargar los lotes que faltan
    for (Map<String, dynamic> download in state.downloads) {
      if (download['errors'].isNotEmpty) {
        for (int i in download['errors']) {
          bool response = await _asyncRepository.downloadBatch(
            resource: download['resource'],
            batch: i,
            recordsPerBatch: state.recordsPerBatch,
          );
          if (response) {
            download['downloaded']++;
            // Sumamos un lote descargado con éxito
            emit(
                state.copyWith(downloadedBatches: state.downloadedBatches + 1));
          } else {
            download['errors'].add(i);
          }
        }
      }
    }

    // Verificamos si se descargaron todos los lotes
    if (state.downloadedBatches == state.batches) {
      emit(state.copyWith(state: 3));
    }

    // Si no se descargaron todos los lotes indicamos que hubo un error
    if (state.downloadedBatches != state.batches) {
      emit(state.copyWith(state: 4));
    }
  }
}
