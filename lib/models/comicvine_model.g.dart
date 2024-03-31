// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comicvine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Series _$SeriesFromJson(Map<String, dynamic> json) => Series(
      (json['results'] as List<dynamic>)
          .map((e) => Series1.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
      'results': instance.results,
    };

Series1 _$Series1FromJson(Map<String, dynamic> json) => Series1(
      json['name'] as String?,
      SeriesImage.fromJson(json['image'] as Map<String, dynamic>),
      json['publisher'] == null
          ? null
          : SeriesPublisher.fromJson(json['publisher'] as Map<String, dynamic>),
      json['count_of_episodes'] as int?,
      json['start_year'] as String?,
      json['api_detail_url'] as String?,
    );

Map<String, dynamic> _$Series1ToJson(Series1 instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'publisher': instance.publisher,
      'count_of_episodes': instance.countOfEpisodes,
      'start_year': instance.startYear,
      'api_detail_url': instance.apiDetailUrl,
    };

SeriesImage _$SeriesImageFromJson(Map<String, dynamic> json) => SeriesImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$SeriesImageToJson(SeriesImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
    };

SeriesPublisher _$SeriesPublisherFromJson(Map<String, dynamic> json) =>
    SeriesPublisher(
      json['name'] as String?,
    );

Map<String, dynamic> _$SeriesPublisherToJson(SeriesPublisher instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Comics _$ComicsFromJson(Map<String, dynamic> json) => Comics(
      (json['results'] as List<dynamic>)
          .map((e) => Comics1.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicsToJson(Comics instance) => <String, dynamic>{
      'results': instance.results,
    };

Comics1 _$Comics1FromJson(Map<String, dynamic> json) => Comics1(
      ComicsName.fromJson(json['volume'] as Map<String, dynamic>),
      ComicsImage.fromJson(json['image'] as Map<String, dynamic>),
      json['name'] as String?,
      json['issue_number'] as String?,
      json['cover_date'] as String?,
      json['api_detail_url'] as String?,
    );

Map<String, dynamic> _$Comics1ToJson(Comics1 instance) => <String, dynamic>{
      'volume': instance.name,
      'image': instance.image,
      'name': instance.name2,
      'issue_number': instance.issueNumber,
      'cover_date': instance.coverDate,
      'api_detail_url': instance.apiDetailUrl,
    };

ComicsImage _$ComicsImageFromJson(Map<String, dynamic> json) => ComicsImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$ComicsImageToJson(ComicsImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
    };

ComicsName _$ComicsNameFromJson(Map<String, dynamic> json) => ComicsName(
      json['name'] as String?,
    );

Map<String, dynamic> _$ComicsNameToJson(ComicsName instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Films _$FilmsFromJson(Map<String, dynamic> json) => Films(
      (json['results'] as List<dynamic>)
          .map((e) => Films1.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilmsToJson(Films instance) => <String, dynamic>{
      'results': instance.results,
    };

Films1 _$Films1FromJson(Map<String, dynamic> json) => Films1(
      json['name'] as String?,
      FilmsImage.fromJson(json['image'] as Map<String, dynamic>),
      json['runtime'] as String?,
      json['date_added'] as String?,
      json['api_detail_url'] as String?,
    );

Map<String, dynamic> _$Films1ToJson(Films1 instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'runtime': instance.runtime,
      'date_added': instance.dateadded,
      'api_detail_url': instance.apiDetailUrl,
    };

FilmsImage _$FilmsImageFromJson(Map<String, dynamic> json) => FilmsImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$FilmsImageToJson(FilmsImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
    };

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      Movie.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      json['name'] as String?,
      MovieImage.fromJson(json['image'] as Map<String, dynamic>),
      json['runtime'] as String?,
      json['date_added'] as String?,
      json['description'] as String?,
      (json['characters'] as List<dynamic>)
          .map((e) => MovieCharacters.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'runtime': instance.runtime,
      'date_added': instance.dateAdded,
      'description': instance.description,
      'characters': instance.characters,
    };

MovieImage _$MovieImageFromJson(Map<String, dynamic> json) => MovieImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$MovieImageToJson(MovieImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
    };

MovieCharacters _$MovieCharactersFromJson(Map<String, dynamic> json) =>
    MovieCharacters(
      json['name'] as String?,
      json['api_detail_url'] as String?,
    );

Map<String, dynamic> _$MovieCharactersToJson(MovieCharacters instance) =>
    <String, dynamic>{
      'name': instance.name,
      'api_detail_url': instance.apiDetailUrl,
    };

SeriesResponse _$SeriesResponseFromJson(Map<String, dynamic> json) =>
    SeriesResponse(
      SeriesD.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeriesResponseToJson(SeriesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SeriesD _$SeriesDFromJson(Map<String, dynamic> json) => SeriesD(
      json['name'] as String?,
      SeriesDImage.fromJson(json['image'] as Map<String, dynamic>),
      json['publisher'] == null
          ? null
          : SeriesDPublisher.fromJson(
              json['publisher'] as Map<String, dynamic>),
      json['count_of_episodes'] as int?,
      json['start_year'] as String?,
      json['description'] as String?,
      (json['characters'] as List<dynamic>)
          .map((e) => SeriesCharacters.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['episodes'] as List<dynamic>)
          .map((e) => SeriesEpisodes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesDToJson(SeriesD instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'publisher': instance.publisher,
      'count_of_episodes': instance.countOfEpisodes,
      'start_year': instance.startYear,
      'description': instance.description,
      'characters': instance.characters,
      'episodes': instance.episodes,
    };

SeriesDImage _$SeriesDImageFromJson(Map<String, dynamic> json) => SeriesDImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$SeriesDImageToJson(SeriesDImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
    };

SeriesDPublisher _$SeriesDPublisherFromJson(Map<String, dynamic> json) =>
    SeriesDPublisher(
      json['name'] as String?,
    );

Map<String, dynamic> _$SeriesDPublisherToJson(SeriesDPublisher instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

SeriesCharacters _$SeriesCharactersFromJson(Map<String, dynamic> json) =>
    SeriesCharacters(
      json['name'] as String?,
      json['api_detail_url'] as String?,
    );

Map<String, dynamic> _$SeriesCharactersToJson(SeriesCharacters instance) =>
    <String, dynamic>{
      'name': instance.name,
      'api_detail_url': instance.apiDetailUrl,
    };

SeriesEpisodes _$SeriesEpisodesFromJson(Map<String, dynamic> json) =>
    SeriesEpisodes(
      json['api_detail_url'] as String?,
    );

Map<String, dynamic> _$SeriesEpisodesToJson(SeriesEpisodes instance) =>
    <String, dynamic>{
      'api_detail_url': instance.apiDetailUrl,
    };

ComicsResponse _$ComicsResponseFromJson(Map<String, dynamic> json) =>
    ComicsResponse(
      ComicsD.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicsResponseToJson(ComicsResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicsD _$ComicsDFromJson(Map<String, dynamic> json) => ComicsD(
      ComicsName.fromJson(json['volume'] as Map<String, dynamic>),
      json['name'] as String?,
      ComicsDImage.fromJson(json['image'] as Map<String, dynamic>),
      json['issue_number'] as String?,
      json['cover_date'] as String?,
      json['description'] as String?,
      (json['character_credits'] as List<dynamic>)
          .map((e) => ComicsCharacters.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['person_credits'] as List<dynamic>)
          .map((e) => ComicsAuteurs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicsDToJson(ComicsD instance) => <String, dynamic>{
      'volume': instance.name,
      'name': instance.name2,
      'image': instance.image,
      'issue_number': instance.issueNumber,
      'cover_date': instance.coverDate,
      'description': instance.description,
      'character_credits': instance.characters,
      'person_credits': instance.auteurs,
    };

ComicsDImage _$ComicsDImageFromJson(Map<String, dynamic> json) => ComicsDImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$ComicsDImageToJson(ComicsDImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
    };

ComicsCharacters _$ComicsCharactersFromJson(Map<String, dynamic> json) =>
    ComicsCharacters(
      json['name'] as String?,
      json['api_detail_url'] as String?,
    );

Map<String, dynamic> _$ComicsCharactersToJson(ComicsCharacters instance) =>
    <String, dynamic>{
      'name': instance.name,
      'api_detail_url': instance.apiDetailUrl,
    };

ComicsAuteurs _$ComicsAuteursFromJson(Map<String, dynamic> json) =>
    ComicsAuteurs(
      json['name'] as String?,
      json['role'] as String?,
      json['api_detail_url'] as String?,
    );

Map<String, dynamic> _$ComicsAuteursToJson(ComicsAuteurs instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'api_detail_url': instance.apiDetailUrl,
    };

CharacterResponse _$CharacterResponseFromJson(Map<String, dynamic> json) =>
    CharacterResponse(
      Character.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterResponseToJson(CharacterResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      CharacterImage.fromJson(json['image'] as Map<String, dynamic>),
      json['name'] as String?,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
    };

CharacterImage _$CharacterImageFromJson(Map<String, dynamic> json) =>
    CharacterImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$CharacterImageToJson(CharacterImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
    };

AuteurResponse _$AuteurResponseFromJson(Map<String, dynamic> json) =>
    AuteurResponse(
      Auteur.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuteurResponseToJson(AuteurResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Auteur _$AuteurFromJson(Map<String, dynamic> json) => Auteur(
      AuteurImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuteurToJson(Auteur instance) => <String, dynamic>{
      'image': instance.image,
    };

AuteurImage _$AuteurImageFromJson(Map<String, dynamic> json) => AuteurImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$AuteurImageToJson(AuteurImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
    };

EpisodeResponse _$EpisodeResponseFromJson(Map<String, dynamic> json) =>
    EpisodeResponse(
      Episode.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeResponseToJson(EpisodeResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      EpisodeImage.fromJson(json['image'] as Map<String, dynamic>),
      json['episode_number'] as String?,
      json['name'] as String?,
      json['air_date'] as String?,
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'image': instance.image,
      'episode_number': instance.episodeNumber,
      'name': instance.name,
      'air_date': instance.airDate,
    };

EpisodeImage _$EpisodeImageFromJson(Map<String, dynamic> json) => EpisodeImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$EpisodeImageToJson(EpisodeImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
    };
