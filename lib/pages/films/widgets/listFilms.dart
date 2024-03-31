import 'package:flutter/material.dart';
import 'package:comicapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

import 'package:comicapp/pages/detailsFilms/detailsFilms.dart';

class ListFilms extends StatelessWidget {
  const ListFilms({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ComicVineRequests().getFilms(),
      builder: (BuildContext context, AsyncSnapshot<Films> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Plus de 200 appels api /movies'));
        } else if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.results.length > 50 ? 50 : snapshot.data!.results.length,
            itemBuilder: (context, index) {
              Films1 films = snapshot.data!.results[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageDetailsfilms(apiDetailUrl: films.apiDetailUrl!)),
                  );
                },   
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 21.0,
                  ),
                  child: SizedBox(
                    width: 359,
                    height: 153,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 359,
                            height: 153,
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
                            height: 118.0,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(films.image.originalUrl!),
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
                          top: 25.47,
                          left: 154.0,
                          child: Container(
                            width: 188.0,
                            height: 26.0,
                            child: Text(
                              films.name!,
                              style: GoogleFonts.nunito(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 89.0,
                          left: 155.0,
                          child: Container(
                            width: 14.44,
                            height: 13.0,
                            child: SvgPicture.asset(
                              'assets/SVG/ic_movie_bicolor.svg',
                              color: Color(0xFF69727D),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 111.49,
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
                          top: 87.99,
                          left: 176.0,
                          child: Container(
                            width: 162.0,
                            height: 16.0,
                            child: Text(
                              '${films.runtime ?? ''} minutes',
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 111.59,
                          left: 176.0,
                          child: Container(
                            width: 165.0,
                            height: 16.0,
                            child: Text(
                              (films.dateadded ?? '').split('-').first,
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