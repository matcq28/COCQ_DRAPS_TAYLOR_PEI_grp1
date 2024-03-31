import 'package:flutter/material.dart';
import 'package:comicapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

import 'package:comicapp/pages/detailsComics/detailsComics.dart';

class ListComics extends StatelessWidget {
  const ListComics({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ComicVineRequests().getComics(),
      builder: (BuildContext context, AsyncSnapshot<Comics> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Plus de 200 appels api /issues'));
        } else if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.results.length > 50 ? 50 : snapshot.data!.results.length,
            itemBuilder: (context, index) {
              Comics1 comics = snapshot.data!.results[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageDetailsComics(apiDetailUrl: comics.apiDetailUrl!)),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 21.0,
                  ),
                  child: SizedBox(
                    width: 359,
                    height: 196,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 359,
                            height: 196,
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
                          top: 21.0,
                          left: 14.0,
                          child: Container(
                            width: 128.86,
                            height: 163.0,
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
                          top: 5.0,
                          left: 7.0,
                          child: Container(
                            width: 59.36,
                            height: 40.0,
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
                          top: 11.0,
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
                          top: 28.0,
                          left: 154.0,
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
                          top: 64.0,
                          left: 154.0,
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
                          top: 130.0,
                          left: 156.0,
                          child: Container(
                            width: 15.0,
                            height: 16.0,
                            child: SvgPicture.asset(
                              'assets/SVG/ic_books_bicolor.svg',
                              color: Color(0xFF69727D),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 156.0,
                          left: 156.0,
                          child: Container(
                            width: 14.0,
                            height: 15.0,
                            child: SvgPicture.asset(
                              'assets/SVG/ic_calendar_bicolor.svg',
                              color: Color(0xFF69727D),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130.0,
                          left: 177.0,
                          child: Container(
                            width: 162.0,
                            height: 16.0,
                            child: Text(
                              'N°${comics.issueNumber ?? ''}',
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 156.0,
                          left: 177.0,
                          child: Container(
                            width: 165.0,
                            height: 16.0,
                            child: Text(
                              comics.coverDate ?? '',
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