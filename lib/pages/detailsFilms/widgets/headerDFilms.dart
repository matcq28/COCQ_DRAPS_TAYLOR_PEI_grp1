import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

class HeaderDFilms extends StatelessWidget {
  final String apiDetailUrl;

  const HeaderDFilms({Key? key, required this.apiDetailUrl}) : super(key: key);

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
          return Stack(
            children: [
              Positioned(
                top: 24.0,
                left: 54.0,
                child: Container(
                  width: 188,
                  height: 26,
                  child: Text(
                    movies.name!,
                    style: GoogleFonts.nunito(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 61.0,
                left: 16.0,
                child: Container(
                  width: 94.87,
                  height: 127,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(movies.image.originalUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 101.01,
                left: 122.0,
                child: Container(
                  width: 14.44,
                  height: 13.0,
                  child: SvgPicture.asset(
                    'assets/SVG/ic_movie_bicolor.svg',
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 132.51,
                left: 122.0,
                child: Container(
                  width: 14.0,
                  height: 15.19,
                  child: SvgPicture.asset(
                    'assets/SVG/ic_calendar_bicolor.svg',
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 98.0,
                left: 143.0,
                child: Container(
                  width: 162.0,
                  height: 19.0,
                  child: Text(
                    '${movies.runtime ?? ''} minutes',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 130.6,
                left: 143.0,
                child: Container(
                  width: 165.0,
                  height: 19.0,
                  child: Text(
                    (movies.dateAdded ?? '').split('-').first,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],    
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );  
  }
}