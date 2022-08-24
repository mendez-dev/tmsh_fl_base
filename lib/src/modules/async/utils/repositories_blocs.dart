import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/network/network_repository.dart';
import '../bloc/download/download_bloc.dart';
import '../repository/async_repository.dart';

// Lista de repositorios usados en este modulo
List<RepositoryProvider> asyncRepositoryProviders = [
  RepositoryProvider<AsyncRepository>(
    create: (context) => AsyncRepository(
        network: RepositoryProvider.of<NetworkRepository>(context)),
  ),
];

// Lista de blocs usados en este modulo
List<BlocProvider> asyncBlocProviders = [
  BlocProvider<DownloadBloc>(
    create: (context) => DownloadBloc(
        asyncRepository: RepositoryProvider.of<AsyncRepository>(context)),
  ),
];
