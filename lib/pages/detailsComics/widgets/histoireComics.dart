import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';
import 'package:comicapp/main.dart';

class HistoireComics extends StatelessWidget {
  final String apiDetailUrl;

  const HistoireComics({Key? key, required this.apiDetailUrl}) : super(key: key);

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

          var description = '';
          if (comics.description == null) {
            description = '';
          } else {
            var document = parse(comics.description!);
            description = parse(document.body!.text).documentElement!.text;
          }
          
          return Padding(
            padding: const EdgeInsets.only(
              top: 228.0,
            ),
            child: SizedBox(
              child: Stack(
                children: [
                  Positioned(
                    top: 0.0,
                    left: 21.0,
                    child: Container(
                      width: 83.0,
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
                  Positioned(
                    top: 25.0,
                    left: 27.0,
                    child: Container(
                      width: 321,
                      height: 400,
                      child: SingleChildScrollView(
                        child: Text(
                          description,
                          style: GoogleFonts.nunito(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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