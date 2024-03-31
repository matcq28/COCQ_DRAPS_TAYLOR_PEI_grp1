import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

class HeaderDSeries extends StatelessWidget {
  final String apiDetailUrl;

  const HeaderDSeries({Key? key, required this.apiDetailUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> segments = apiDetailUrl.split('/');
    String lastSegment = segments[segments.length - 2];

    return FutureBuilder(
      future: ComicVineRequests().getSeriesDetails(lastSegment),
      builder: (BuildContext context, AsyncSnapshot<SeriesResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Plus de 200 appels api /series_list'));
        } else if (snapshot.hasData) {
          SeriesD series = snapshot.data!.results;
          return Stack(
            children: [
              Positioned(
                top: 24.0,
                left: 54.0,
                child: Container(
                  width: 188,
                  height: 26,
                  child: Text(
                    series.name!,
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
                      image: NetworkImage(series.image.originalUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 88.01,
                left: 129.0,
                child: Container(
                  width: 17.0,
                  height: 13.6,
                  child: SvgPicture.asset(
                    'assets/SVG/ic_publisher_bicolor.svg',
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 114.27,
                left: 129.0,
                child: Container(
                  width: 17.0,
                  height: 17.0,
                  child: SvgPicture.asset(
                    'assets/SVG/ic_tv_bicolor.svg',
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 146.58,
                left: 129.0,
                child: Container(
                  width: 16.0,
                  height: 17.14,
                  child: SvgPicture.asset(
                    'assets/SVG/ic_calendar_bicolor.svg',
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 85.0,
                left: 151.0,
                child: Container(
                  width: 162.0,
                  height: 19.0,
                  child: Text(
                    series.publisher?.name ?? '',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 114.28,
                left: 150.0,
                child: Container(
                  width: 162.0,
                  height: 19.0,
                  child: Text(
                    '${series.countOfEpisodes.toString()} épisodes',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 145.58,
                left: 150.0,
                child: Container(
                  width: 162.0,
                  height: 19.0,
                  child: Text(
                    series.startYear!,
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