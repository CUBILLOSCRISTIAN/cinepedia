import 'package:cinepedia/config/constants/environment.dart';
import 'package:cinepedia/domain/datasources/movies_datasource.dart';
import 'package:cinepedia/domain/entities/movie.dart';
import 'package:cinepedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinepedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class TheMoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }),
  );
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
