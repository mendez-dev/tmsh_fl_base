import 'package:base/src/modules/movies/bloc/movies_bloc/movies_bloc.dart';
import 'package:base/src/modules/movies/repositories/movies_repository/movies_repository.dart';
import 'package:base/src/modules/movies/repositories/movies_repository/movies_repository_impl.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:base/src/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<MoviesRepository>(
      create: (BuildContext context) => MoviesRepositoryImpl(
          context: context,
          network: RepositoryProvider.of<NetworkRepository>(context)),
      child: BlocProvider<MoviesBloc>(
        create: (BuildContext context) => MoviesBloc(
            moviesRepository: RepositoryProvider.of<MoviesRepository>(context)),
        child: const HomePageWidget(),
      ),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late MoviesBloc moviesBloc;
  final RefreshController _controller = RefreshController();

  @override
  void initState() {
    moviesBloc = BlocProvider.of<MoviesBloc>(context);
    moviesBloc.add(GetMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My movie app"),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, 'settings'),
              icon: const Icon(FontAwesomeIcons.cogs))
        ],
      ),
      body: BlocConsumer<MoviesBloc, MoviesState>(
        listener: (BuildContext context, MoviesState state) {
          if (state.refreshStatus == RefreshStatus.canRefresh) {
            _controller.loadComplete();
            _controller.refreshCompleted(resetFooterState: true);
          }
          if (state.refreshStatus == RefreshStatus.completed) {
            _controller.loadNoData();
          }
        },
        builder: (BuildContext context, MoviesState state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.movies.isNotEmpty) {
            return SmartRefresher(
              header: WaterDropMaterialHeader(
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              ),
              controller: _controller,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: () => moviesBloc.add(RefreshMoviesEvent()),
              onLoading: () => moviesBloc.add(LoadMoreMoviesEvent()),
              child: SingleChildScrollView(
                child: Column(
                  children: state.movies
                      .map((m) => ListTile(
                            trailing: const Icon(FontAwesomeIcons.chevronRight),
                            leading: m.posterPath != null
                                ? Image.network(
                                    "https://image.tmdb.org/t/p/w500/${m.posterPath}")
                                : const SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: Center(
                                        child:
                                            Icon(FontAwesomeIcons.infoCircle))),
                            title: Text(m.title),
                            subtitle: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.star,
                                  size: 15,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(width: 10),
                                Text("Vote average ${m.voteAverage}"),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            );
          }

          return const Center(child: Text("No data found"));
        },
      ),
    );
  }
}
