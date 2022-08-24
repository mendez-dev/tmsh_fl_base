part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();

  @override
  List<Object> get props => [];
}

class DownloadInitialEvent implements DownloadEvent {
  /// Lista de String con los nombres de los recursos a descargar
  final List<String> resources;

  const DownloadInitialEvent({required this.resources});

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

/// Evento que indica que se debe descargar un lote de datos
class StartDownloadEvent implements DownloadEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
