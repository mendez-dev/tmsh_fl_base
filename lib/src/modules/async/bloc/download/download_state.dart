part of 'download_bloc.dart';

/// Clase que representa el estado del Bloc de la descarga de datos
class DownloadState extends Equatable {
  /// Estado del proceso de descarga de datos
  /// 0: Obteniendo la información de la cantidad de lotes
  /// 1: Descarga lista para iniciar
  /// 2: Descargando los datos
  /// 3: Descarga completa
  final int state;

  /// Cantidad de lotes a descargar
  final int batches;

  /// Cantidad de registros que se descargarán por lote
  final int recordsPerBatch;

  /// Lista de recursos a descargar
  final List<String> resources;

  /// Lista con mapas que contendrá la información las descargas que se realizaran
  final List<Map<String, dynamic>> downloads;

  /// Almacena el progreso de la descarga
  final double progress;

  /// Almacena el numero de lotes descargados con éxito
  final int downloadedBatches;

  const DownloadState({
    required this.state,
    required this.batches,
    required this.recordsPerBatch,
    required this.resources,
    required this.downloads,
    required this.progress,
    required this.downloadedBatches,
  });

  factory DownloadState.initial() {
    return const DownloadState(
      state: 0,
      batches: 0,
      recordsPerBatch: 1000,
      resources: [],
      downloads: [],
      progress: 0,
      downloadedBatches: 0,
    );
  }

  DownloadState copyWith({
    int? state,
    int? batches,
    int? recordsPerBatch,
    List<String>? resources,
    List<Map<String, dynamic>>? downloads,
    double? progress,
    int? totalBatches,
    int? downloadedBatches,
  }) {
    return DownloadState(
      state: state ?? this.state,
      batches: batches ?? this.batches,
      recordsPerBatch: recordsPerBatch ?? this.recordsPerBatch,
      resources: resources ?? this.resources,
      downloads: downloads ?? this.downloads,
      progress: progress ?? this.progress,
      downloadedBatches: downloadedBatches ?? this.downloadedBatches,
    );
  }

  @override
  List<Object> get props => [
        state,
        batches,
        recordsPerBatch,
        resources,
        downloads,
        progress,
        downloadedBatches
      ];
}
