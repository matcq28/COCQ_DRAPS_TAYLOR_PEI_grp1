import 'package:dio/dio.dart';
import 'package:comicapp/models/comicvine_model.dart';
import 'package:retrofit/retrofit.dart';

part 'comicvine_api.g.dart';

@RestApi(baseUrl: 'https://comicvine.gamespot.com/api/')
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio) = _ComicVineAPI;

  @GET('series_list')
  Future<Series> loadSeries();

  @GET('issues')
  Future<Comics> loadComics();

  @GET('movies')
  Future<Films> loadFilms();

  @GET('movie/{id}/')
  Future<MovieResponse> loadMovieDetails(@Path('id') String movieId);

  @GET('character/{id}/')
  Future<CharacterResponse> loadCharacter(@Path('id') String characterId);

  @GET('series/{id}/')
  Future<SeriesResponse> loadSeriesDetails(@Path('id') String seriesId);

  @GET('issue/{id}/')
  Future<ComicsResponse> loadComicsDetails(@Path('id') String comicsId);

  @GET('person/{id}/')
  Future<AuteurResponse> loadAuteur(@Path('id') String auteurId);

  @GET('episode/{id}/')
  Future<EpisodeResponse> loadEpisode(@Path('id') String episodeId);
}

class ComicVineRequests {
  static final ComicVineRequests _singleton = ComicVineRequests._internal();
  factory ComicVineRequests() {
    return _singleton;
  }
  ComicVineRequests._internal();

  final ComicVineAPI _api = ComicVineAPI(Dio(
    BaseOptions(queryParameters: {
      'api_key': 'f689ea8f8e3c563e7ce7c9d7da46cc4ead3ef316',
      'format': 'json',
    }),
  ));

  Future<Series> getSeries() async {
    try {
      return await _api.loadSeries();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Comics> getComics() async {
    try {
      return await _api.loadComics();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Films> getFilms() async {
    try {
      return await _api.loadFilms();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<MovieResponse> getMovieDetails(String movieId) async {
    try {
      return await _api.loadMovieDetails(movieId);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<CharacterResponse> getCharacter(String characterId) async {
    try {
      return await _api.loadCharacter(characterId);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<SeriesResponse> getSeriesDetails(String seriesId) async {
    try {
      return await _api.loadSeriesDetails(seriesId);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<ComicsResponse> getComicsDetails(String comicsId) async {
    try {
      return await _api.loadComicsDetails(comicsId);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<AuteurResponse> getAuteur(String auteurId) async {
    try {
      return await _api.loadAuteur(auteurId);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<EpisodeResponse> getEpisode(String episodeId) async {
    try {
      return await _api.loadEpisode(episodeId);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
