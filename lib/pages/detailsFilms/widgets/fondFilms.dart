import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

class FondFilms extends StatelessWidget {
  final String apiDetailUrl;

  const FondFilms({Key? key, required this.apiDetailUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> segments = apiDetailUrl.split('/');
    String lastSegment = segments[segments.length - 2];

    return FutureBuilder(
      future: ComicVineRequests().getMovieDetails(lastSegment),
      builder: (BuildContext context, AsyncSnapshot<MovieResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Plus de 200 appels api /movies'));
        } else if (snapshot.hasData) {
          Movie movies = snapshot.data!.results;
          return Positioned(
            top: -403,
            left: -240,
            child: Container(
              width: 960,
              height: 960,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(movies.image.originalUrl!),
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