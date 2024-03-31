import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

class HeaderDComics extends StatelessWidget {
  final String apiDetailUrl;

  const HeaderDComics({Key? key, required this.apiDetailUrl}) : super(key: key);

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
          return Stack(
            children: [
              Positioned(
                top: 24.0,
                left: 54.0,
                child: Container(
                  width: 188.0,
                  height: 26.0,
                  child: Text(
                    comics.name.name!,
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
                      image: NetworkImage(comics.image.originalUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 73.0,
                left: 128.0,
                child: Container(
                  width: 191.0,
                  height: 44.0,
                  child: Text(
                    comics.name2 ?? '',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 136.0,
                left: 126.0,
                child: Container(
                  width: 15.0,
                  height: 16.0,
                  child: SvgPicture.asset(
                    'assets/SVG/ic_books_bicolor.svg',
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 161.0,
                left: 126.0,
                child: Container(
                  width: 14.0,
                  height: 15.0,
                  child: SvgPicture.asset(
                    'assets/SVG/ic_calendar_bicolor.svg',
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 137.0,
                left: 147.0,
                child: Container(
                  width: 162.0,
                  height: 15.0,
                  child: Text(
                    'N°${comics.issueNumber ?? ''}',
                    style: GoogleFonts.nunito(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 161.0,
                left: 147.0,
                child: Container(
                  width: 165.0,
                  height: 15.0,
                  child: Text(
                    comics.coverDate ?? '',
                    style: GoogleFonts.nunito(
                      fontSize: 11,
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