import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

class FondComics extends StatelessWidget {
  final String apiDetailUrl;

  const FondComics({Key? key, required this.apiDetailUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> segments = apiDetailUrl.split('/');
    String lastSegment = segments[segments.length - 2];

    return FutureBuilder(
      future: ComicVineRequests().getComicsDetails(lastSegment),
      builder: (BuildContext context, AsyncSnapshot<ComicsResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Plus de 200 appels api /issue'));
        } else if (snapshot.hasData) {
          ComicsD comics = snapshot.data!.results;
          return Positioned(
            top: -403,
            left: -240,
            child: Container(
              width: 960,
              height: 960,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(comics.image.originalUrl!),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
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