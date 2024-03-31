import 'package:flutter/material.dart';
import 'package:comicapp/main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

import 'package:comicapp/pages/detailsFilms/detailsFilms.dart';

class RectangleFilms extends StatelessWidget {
  final VoidCallback onNavigateToFilmsPage;
  const RectangleFilms({Key? key, required this.onNavigateToFilmsPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ComicVineRequests().getFilms(),
      builder: (BuildContext context, AsyncSnapshot<Films> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Plus de 200 appels api /movies'));
        } else if (snapshot.hasData) {
          return Stack(
            children: [
              Container(
                height: 329,
                decoration: const BoxDecoration(
                  color: AppColors.ArrPlanCarte,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.results.length > 5 ? 5 : snapshot.data!.results.length,
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
                        padding: EdgeInsets.only(
                          left: index == 0 ? 17 : 0,
                          right: 10,
                        ),
                        child: SizedBox(
                          width: 180,
                          height: 329,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 68,
                                left: 0,
                                child: Container(
                                  width: 180,
                                  height: 242,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(films.image.originalUrl!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 19,
                                left: 0,
                                child: SizedBox(
                                  width: 180,
                                  height: 65,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          width: 180,
                                          height: 65,
                                          decoration: const BoxDecoration(
                                            color: AppColors.ArrPlanElCarte,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.0),
                                              bottomRight: Radius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 9,
                                        left: 11,
                                        child: Container(
                                          width: 156,
                                          height: 44,
                                          child: Text(
                                            films.name!,
                                            style: GoogleFonts.nunito(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 31,
                left: 17,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.Orange,
                  ),
                ),
              ),
              Positioned(
                top: 22,
                left: 36,
                child: Container(
                  width: 170,
                  height: 27,
                  child: Text(
                    "Films populaires",
                    style: GoogleFonts.nunito(
                      fontSize: 19.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 22,
                left: 265,
                child: GestureDetector(
                  onTap: onNavigateToFilmsPage,
                  child: Container(
                    width: 92,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.ArrPlanVoirPlus,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Voir plus",
                        style: GoogleFonts.nunito(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
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
