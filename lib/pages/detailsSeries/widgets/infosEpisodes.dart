import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

import 'package:comicapp/main.dart';

class InfosEpisodes extends StatelessWidget {
  final String apiDetailUrl;

  const InfosEpisodes({Key? key, required this.apiDetailUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> segments = apiDetailUrl.split('/');
    String lastSegment = segments[segments.length - 2];

    return FutureBuilder(
      future: ComicVineRequests().getEpisode(lastSegment),
      builder: (BuildContext context, AsyncSnapshot<EpisodeResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Plus de 200 appels api /episode'));
        } else if (snapshot.hasData) {
          Episode episode = snapshot.data!.results;         
          return SizedBox(
            width: 344.0,
            height: 129.0,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0.0,
                  child: Container(
                    width: 344.0,
                    height: 129.0,
                    decoration: const BoxDecoration(
                      color: AppColors.ArrPlanElCarte,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 11.0,
                  left: 13.0,
                  child: Container(
                    width: 126.0,
                    height: 105.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(episode.image.originalUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 19.0,
                  left: 158.0,
                  child: Container(
                    width: 107.0,
                    height: 23.0,
                    child: Text(
                      'Episode #${episode.episodeNumber!}',
                      style: GoogleFonts.nunito(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 47.0,
                  left: 158.0,
                  child: Container(
                    width: 107.0,
                    height: 20.0,
                    child: Text(
                      episode.name!,
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 84.0,
                  left: 158.0,
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
                  top: 84.0,
                  left: 179.0,
                  child: Container(
                    width: 165.0,
                    height: 15.0,
                    child: Text(
                      episode.airDate!,
                      style: GoogleFonts.nunito(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );  
  }
}