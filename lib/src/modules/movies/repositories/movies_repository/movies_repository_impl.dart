import 'package:base/src/modules/movies/models/movies_response.dart';
import 'package:base/src/modules/movies/repositories/movies_repository/movies_repository.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:base/src/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MoviesRepositoryImpl implements MoviesRepository{

  final BuildContext context;
  final NetworkRepository network;

  MoviesRepositoryImpl({required this.context, required this.network});
  @override
  Future<MoviesResponse?> getNowPlaying({int page = 1}) async {
    logger.i(page);
    try {
      final response = await network.instance!.get("/movie/now_playing?page=$page");

      if (response.statusCode == 200) {
        return MoviesResponse.fromJson(response.data);
      }

      Fluttertoast.showToast(msg: "Error trying to get movies");
      
    } on DioError catch (error) {
      logger.e(error);
      Fluttertoast.showToast(msg: "Error trying to get movies");
    }
    
  }

}