import 'package:flutter/material.dart';
import 'package:comicapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

import 'package:comicapp/pages/detailsSeries/detailsSeries.dart';

class ListSeries extends StatelessWidget {
  const ListSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ComicVineRequests().getSeries(),
      builder: (BuildContext context, AsyncSnapshot<Series> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Plus de 200 appels api /series_list'));
        } else if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.results.length > 50 ? 50 : snapshot.data!.results.length,
            itemBuilder: (context, index) {
              Series1 series = snapshot.data!.results[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageDetailsSeries(apiDetailUrl: series.apiDetailUrl!)),
                  );
                },        
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 21.0,
                  ),
                  child: SizedBox(
                    width: 359,
                    height: 164,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 359,
                            height: 164,
                            decoration: const BoxDecoration(
                              color: AppColors.ArrPlanCarte,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 21.26,
                          left: 14.0,
                          child: Container(
                            width: 128.86,
                            height: 132.62,
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
                          top: 5.06,
                          left: 7,
                          child: Container(
                            width: 59.36,
                            height: 40.49,
                            decoration: const BoxDecoration(
                              color: AppColors.Orange,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 11.32,
                          left: 23.0,
                          child: Container(
                            width: 27.0,
                            height: 30.0,
                            child: Text(
                              '#${index + 1}',
                              style: GoogleFonts.nunito(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 22.54,
                          left: 154.0,
                          child: Container(
                            width: 188.0,
                            height: 44.0,
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
                          top: 74.91,
                          left: 155.0,
                          child: Container(
                            width: 15.0,
                            height: 12.15,
                            child: SvgPicture.asset(
                              'assets/SVG/ic_publisher_bicolor.svg',
                              color: Color(0xFF69727D),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 96.17,
                          left: 155.0,
                          child: Container(
                            width: 15.0,
                            height: 15.19,
                            child: SvgPicture.asset(
                              'assets/SVG/ic_tv_bicolor.svg',
                              color: Color(0xFF69727D),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 122.49,
                          left: 155.0,
                          child: Container(
                            width: 14.0,
                            height: 15.19,
                            child: SvgPicture.asset(
                              'assets/SVG/ic_calendar_bicolor.svg',
                              color: Color(0xFF69727D),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 72.99,
                          left: 176.0,
                          child: Container(
                            width: 162.0,
                            height: 16.0,
                            child: Text(
                              series.publisher?.name ?? '',
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 96.27,
                          left: 176.0,
                          child: Container(
                            width: 162.0,
                            height: 16.0,
                            child: Text(
                              '${series.countOfEpisodes.toString()} épisodes',
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 122.59,
                          left: 176.0,
                          child: Container(
                            width: 165.0,
                            height: 16.0,
                            child: Text(
                              series.startYear!,
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}