import 'package:cinepedia/infrastructure/datasources/the_movie_db_datasource.dart';
import 'package:cinepedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este repositorio es inmutable
final movieRepositoryProvider = Provider(
  (ref) {
    return MovieRepositoryImpl(TheMoviedbDatasource());
  },
);
