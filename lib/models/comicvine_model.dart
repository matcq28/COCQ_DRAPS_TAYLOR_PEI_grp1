import 'package:json_annotation/json_annotation.dart';

part 'comicvine_model.g.dart';

//Series
@JsonSerializable()
class Series {
  @JsonKey(name: 'results')
  final List<Series1> results;

  Series(this.results);

  factory Series.fromJson(Map<String, dynamic> json) =>
      _$SeriesFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesToJson(this);
}

//Infos Series
@JsonSerializable()
class Series1 {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final SeriesImage image;

  @JsonKey(name: 'publisher')
  final SeriesPublisher? publisher;

  @JsonKey(name: 'count_of_episodes')
  final int? countOfEpisodes;

  @JsonKey(name: 'start_year')
  final String? startYear;

  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  Series1(this.name, this.image, this.publisher, this.countOfEpisodes, this.startYear, this.apiDetailUrl);

  factory Series1.fromJson(Map<String, dynamic> json) =>
      _$Series1FromJson(json);

  Map<String, dynamic> toJson() => _$Series1ToJson(this);
}

//Infos Image Series
@JsonSerializable()
class SeriesImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  SeriesImage(this.originalUrl);

  factory SeriesImage.fromJson(Map<String, dynamic> json) =>
      _$SeriesImageFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesImageToJson(this);
}

//Infos Nom Publisher Series
@JsonSerializable()
class SeriesPublisher {
  @JsonKey(name: 'name')
  final String? name;

  SeriesPublisher(this.name);

  factory SeriesPublisher.fromJson(Map<String, dynamic> json) =>
      _$SeriesPublisherFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesPublisherToJson(this);
}

//Comics
@JsonSerializable()
class Comics {
  @JsonKey(name: 'results')
  final List<Comics1> results;

  Comics(this.results);

  factory Comics.fromJson(Map<String, dynamic> json) =>
      _$ComicsFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsToJson(this);
}

//Infos Comics
@JsonSerializable()
class Comics1 {
  @JsonKey(name: 'volume')
  final ComicsName name;

  @JsonKey(name: 'image')
  final ComicsImage image;

  @JsonKey(name: 'name')
  final String? name2;

  @JsonKey(name: 'issue_number')
  final String? issueNumber;

  @JsonKey(name: 'cover_date')
  final String? coverDate;

  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  Comics1(this.name, this.image, this.name2, this.issueNumber, this.coverDate, this.apiDetailUrl);

  factory Comics1.fromJson(Map<String, dynamic> json) =>
      _$Comics1FromJson(json);

  Map<String, dynamic> toJson() => _$Comics1ToJson(this);
}

//Infos Image Comics
@JsonSerializable()
class ComicsImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  ComicsImage(this.originalUrl);

  factory ComicsImage.fromJson(Map<String, dynamic> json) =>
      _$ComicsImageFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsImageToJson(this);
}

//Infos Name Comics
@JsonSerializable()
class ComicsName {
  @JsonKey(name: 'name')
  final String? name;

  ComicsName(this.name);

  factory ComicsName.fromJson(Map<String, dynamic> json) =>
      _$ComicsNameFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsNameToJson(this);
}

//Films
@JsonSerializable()
class Films {
  @JsonKey(name: 'results')
  final List<Films1> results;

  Films(this.results);

  factory Films.fromJson(Map<String, dynamic> json) =>
      _$FilmsFromJson(json);

  Map<String, dynamic> toJson() => _$FilmsToJson(this);
}

//Infos Films
@JsonSerializable()
class Films1 {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final FilmsImage image;

  @JsonKey(name: 'runtime')
  final String? runtime;

  @JsonKey(name: 'date_added')
  final String? dateadded;

  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  Films1(this.name, this.image, this.runtime, this.dateadded, this.apiDetailUrl);

  factory Films1.fromJson(Map<String, dynamic> json) =>
      _$Films1FromJson(json);

  Map<String, dynamic> toJson() => _$Films1ToJson(this);
}

//Infos Image Films
@JsonSerializable()
class FilmsImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  FilmsImage(this.originalUrl);

  factory FilmsImage.fromJson(Map<String, dynamic> json) =>
      _$FilmsImageFromJson(json);

  Map<String, dynamic> toJson() => _$FilmsImageToJson(this);
}

//Details Films
@JsonSerializable()
class MovieResponse {
  @JsonKey(name: 'results')
  final Movie results;

  MovieResponse(this.results);

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

//Infos Details Films
@JsonSerializable()
class Movie {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final MovieImage image;

  @JsonKey(name: 'runtime')
  final String? runtime;

  @JsonKey(name: 'date_added')
  final String? dateAdded;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'characters')
  final List<MovieCharacters> characters;

  Movie(this.name, this.image, this.runtime, this.dateAdded, this.description, this.characters);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

//Infos Image Details Films
@JsonSerializable()
class MovieImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  MovieImage(this.originalUrl);

  factory MovieImage.fromJson(Map<String, dynamic> json) =>
      _$MovieImageFromJson(json);

  Map<String, dynamic> toJson() => _$MovieImageToJson(this);
}

//Infos Chararters Details Films
@JsonSerializable()
class MovieCharacters {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  MovieCharacters(this.name, this.apiDetailUrl);

  factory MovieCharacters.fromJson(Map<String, dynamic> json) =>
      _$MovieCharactersFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCharactersToJson(this);
}

//Details Series
@JsonSerializable()
class SeriesResponse {
  @JsonKey(name: 'results')
  final SeriesD results;

  SeriesResponse(this.results);

  factory SeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$SeriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesResponseToJson(this);
}

//Infos Details Series
@JsonSerializable()
class SeriesD {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final SeriesDImage image;

  @JsonKey(name: 'publisher')
  final SeriesDPublisher? publisher;

  @JsonKey(name: 'count_of_episodes')
  final int? countOfEpisodes;

  @JsonKey(name: 'start_year')
  final String? startYear;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'characters')
  final List<SeriesCharacters> characters;

  @JsonKey(name: 'episodes')
  final List<SeriesEpisodes> episodes;

  SeriesD(this.name, this.image, this.publisher, this.countOfEpisodes, this.startYear, this.description, this.characters, this.episodes);

  factory SeriesD.fromJson(Map<String, dynamic> json) => 
      _$SeriesDFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesDToJson(this);
}

//Infos Image Details Series
@JsonSerializable()
class SeriesDImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  SeriesDImage(this.originalUrl);

  factory SeriesDImage.fromJson(Map<String, dynamic> json) =>
      _$SeriesDImageFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesDImageToJson(this);
}

//Infos Nom Publisher Details Series
@JsonSerializable()
class SeriesDPublisher {
  @JsonKey(name: 'name')
  final String? name;

  SeriesDPublisher(this.name);

  factory SeriesDPublisher.fromJson(Map<String, dynamic> json) =>
      _$SeriesDPublisherFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesDPublisherToJson(this);
}

//Infos Chararters Details Series
@JsonSerializable()
class SeriesCharacters {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  SeriesCharacters(this.name, this.apiDetailUrl);

  factory SeriesCharacters.fromJson(Map<String, dynamic> json) =>
      _$SeriesCharactersFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesCharactersToJson(this);
}

//Infos Episodes Details Series
@JsonSerializable()
class SeriesEpisodes {
  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  SeriesEpisodes(this.apiDetailUrl);

  factory SeriesEpisodes.fromJson(Map<String, dynamic> json) =>
      _$SeriesEpisodesFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesEpisodesToJson(this);
}

//Details Comics
@JsonSerializable()
class ComicsResponse {
  @JsonKey(name: 'results')
  final ComicsD results;

  ComicsResponse(this.results);

  factory ComicsResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsResponseToJson(this);
}

//Infos Details Comics
@JsonSerializable()
class ComicsD {
@JsonKey(name: 'volume')
  final ComicsName name;

  @JsonKey(name: 'name')
  final String? name2;

  @JsonKey(name: 'image')
  final ComicsDImage image;

  @JsonKey(name: 'issue_number')
  final String? issueNumber;

  @JsonKey(name: 'cover_date')
  final String? coverDate;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'character_credits')
  final List<ComicsCharacters> characters;

  @JsonKey(name: 'person_credits')
  final List<ComicsAuteurs> auteurs;

  ComicsD(this.name, this.name2, this.image, this.issueNumber, this.coverDate, this.description, this.characters, this.auteurs);

  factory ComicsD.fromJson(Map<String, dynamic> json) => 
      _$ComicsDFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsDToJson(this);
}

//Infos Image Details Comics
@JsonSerializable()
class ComicsDImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  ComicsDImage(this.originalUrl);

  factory ComicsDImage.fromJson(Map<String, dynamic> json) =>
      _$ComicsDImageFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsDImageToJson(this);
}

//Infos Chararters Details Comics
@JsonSerializable()
class ComicsCharacters {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  ComicsCharacters(this.name, this.apiDetailUrl);

  factory ComicsCharacters.fromJson(Map<String, dynamic> json) =>
      _$ComicsCharactersFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsCharactersToJson(this);
}

//Infos Auteurs Details Comics
@JsonSerializable()
class ComicsAuteurs {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'role')
  final String? role;

  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  ComicsAuteurs(this.name, this.role, this.apiDetailUrl);

  factory ComicsAuteurs.fromJson(Map<String, dynamic> json) =>
      _$ComicsAuteursFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsAuteursToJson(this);
}

//Characters
@JsonSerializable()
class CharacterResponse {
  @JsonKey(name: 'results')
  final Character results;

  CharacterResponse(this.results);

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseToJson(this);
}

//Infos Character
@JsonSerializable()
class Character {
  @JsonKey(name: 'image')
  final CharacterImage image;

  @JsonKey(name: 'name')
  final String? name;

  Character(this.image, this.name);

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

//Infos Image Character
@JsonSerializable()
class CharacterImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  CharacterImage(this.originalUrl);

  factory CharacterImage.fromJson(Map<String, dynamic> json) =>
      _$CharacterImageFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterImageToJson(this);
}

//Auteur
@JsonSerializable()
class AuteurResponse {
  @JsonKey(name: 'results')
  final Auteur results;

  AuteurResponse(this.results);

  factory AuteurResponse.fromJson(Map<String, dynamic> json) =>
      _$AuteurResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuteurResponseToJson(this);
}

//Infos Auteur
@JsonSerializable()
class Auteur {
  @JsonKey(name: 'image')
  final AuteurImage image;

  Auteur(this.image);

  factory Auteur.fromJson(Map<String, dynamic> json) =>
      _$AuteurFromJson(json);

  Map<String, dynamic> toJson() => _$AuteurToJson(this);
}

//Infos Image Auteur
@JsonSerializable()
class AuteurImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  AuteurImage(this.originalUrl);

  factory AuteurImage.fromJson(Map<String, dynamic> json) =>
      _$AuteurImageFromJson(json);

  Map<String, dynamic> toJson() => _$AuteurImageToJson(this);
}

//Episode
@JsonSerializable()
class EpisodeResponse {
  @JsonKey(name: 'results')
  final Episode results;

  EpisodeResponse(this.results);

  factory EpisodeResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeResponseToJson(this);
}

//Infos Episode
@JsonSerializable()
class Episode {
  @JsonKey(name: 'image')
  final EpisodeImage image;

  @JsonKey(name: 'episode_number')
  final String? episodeNumber;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'air_date')
  final String? airDate;

  Episode(this.image, this.episodeNumber, this.name, this.airDate);

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}

//Infos Image Episode
@JsonSerializable()
class EpisodeImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  EpisodeImage(this.originalUrl);

  factory EpisodeImage.fromJson(Map<String, dynamic> json) =>
      _$EpisodeImageFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeImageToJson(this);
}