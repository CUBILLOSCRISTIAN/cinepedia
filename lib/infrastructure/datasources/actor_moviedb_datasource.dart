import 'package:cinepedia/config/constants/environment.dart';
import 'package:cinepedia/domain/datasources/actors_datasource.dart';
import 'package:cinepedia/domain/entities/actor.dart';
import 'package:cinepedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinepedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    if (response.statusCode != 200) {
      throw Exception('Movie with id: $movieId not found');
    }

    final castResponse = CreditsResponse.fromJson(response.data);
    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
