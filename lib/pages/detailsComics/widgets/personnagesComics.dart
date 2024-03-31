import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

import 'package:comicapp/main.dart';
import 'package:comicapp/pages/detailsFilms/widgets/imageCharactersFilms.dart';

class PersonnagesComics extends StatelessWidget {
  final String apiDetailUrl;

  const PersonnagesComics({Key? key, required this.apiDetailUrl}) : super(key: key);

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
          return Padding(
            padding: const EdgeInsets.only(
              top: 228.0,
            ),
            child: SizedBox(
              child: Stack(
                children: [
                  Positioned(
                    top: 0.0,
                    left: 240.0,
                    child: Container(
                      width: 118.0,
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
                  if (comics.characters.isNotEmpty) ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: comics.characters.length,
                    itemBuilder: (context, index) {
                      ComicsCharacters comcis2 = comics.characters[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 15.0,
                          left: 25.0,
                        ),
                        child: SizedBox(
                          width: 257.0,
                          height: 45.0,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 12.0,
                                left: 63.0,
                                child: Container(
                                  width: 194.0,
                                  height: 23.0,
                                  child: Text(
                                    comcis2.name!,
                                    style: GoogleFonts.nunito(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                child: ImageCharacterFilms(apiDetailUrl: comcis2.apiDetailUrl!),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
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
