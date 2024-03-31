import 'package:flutter/material.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

class ImageCharacterFilms extends StatelessWidget {
  final String apiDetailUrl;

  const ImageCharacterFilms({Key? key, required this.apiDetailUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> segments = apiDetailUrl.split('/');
    String lastSegment = segments[segments.length - 2];

    return FutureBuilder(
      future: ComicVineRequests().getCharacter(lastSegment),
      builder: (BuildContext context, AsyncSnapshot<CharacterResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Plus de 200 appels api /character'));
        } else if (snapshot.hasData) {
          Character character = snapshot.data!.results;
          
          return Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(22.0),
                bottomLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0),
                bottomRight: Radius.circular(22.0),
              ),
              image: DecorationImage(
                image: NetworkImage(character.image.originalUrl!),
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );  
  }
}