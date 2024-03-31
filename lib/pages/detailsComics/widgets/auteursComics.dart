import 'package:flutter/material.dart';
import 'package:comicapp/main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

import 'package:comicapp/pages/detailsComics/widgets/imageAuteurs.dart';

class AuteursComics extends StatelessWidget {
  final String apiDetailUrl;

  const AuteursComics({Key? key, required this.apiDetailUrl}) : super(key: key);

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
          return Padding(
            padding: const EdgeInsets.only(
              top: 228.0,
            ),
            child: SizedBox(
              child: Stack(
                children: [
                  Positioned(
                    top: 0.0,
                    left: 135.0,
                    child: Container(
                      width: 73.0,
                      height: 4.0,
                      decoration: const BoxDecoration(
                        color: AppColors.Orange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    left: 0,
                    child: Container(
                      width: 375,
                      height: 2000,
                      decoration: const BoxDecoration(
                        color: AppColors.ArrPlanCarte,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.results.auteurs.length,
                    itemBuilder: (context, index) {
                      ComicsAuteurs comicsauteurs = snapshot.data!.results.auteurs[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: 15.0,
                          left: 25.0,
                          top: index == 0 ? 33.0 : 0.0,
                        ),
                        child: SizedBox(
                          width: 250.0,
                          height: 46.0,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 63.0,
                                child: Container(
                                  width: 187.0,
                                  height: 23.0,
                                  child: Text(
                                    comicsauteurs.name!,
                                    style: GoogleFonts.nunito(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 23.0,
                                left: 63.0,
                                child: Container(
                                  width: 187.0,
                                  height: 23.0,
                                  child: Text(
                                    comicsauteurs.role!,
                                    style: GoogleFonts.nunito(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                child: ImageAuteurs(apiDetailUrl: comicsauteurs.apiDetailUrl!),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],    
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