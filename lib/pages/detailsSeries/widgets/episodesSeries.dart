import 'package:flutter/material.dart';

import 'package:comicapp/models/comicvine_model.dart';
import 'package:comicapp/models/comicvine_api.dart';

import 'package:comicapp/main.dart';
import 'package:comicapp/pages/detailsSeries/widgets/infosEpisodes.dart';

class EpisodesSeries extends StatelessWidget {
  final String apiDetailUrl;

  const EpisodesSeries({Key? key, required this.apiDetailUrl}) : super(key: key);

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
          return Center(child: Text('Plus de 200 appels api /series'));
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
                    left: 280.0,
                    child: Container(
                      width: 82.0,
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
                    itemCount: snapshot.data!.results.episodes.length,
                    itemBuilder: (context, index) {
                      SeriesEpisodes seriesepisodes = snapshot.data!.results.episodes[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: 15.0,
                          left: 16.0,
                          top: index == 0 ? 28.0 : 0.0,
                        ),
                        child: InfosEpisodes(apiDetailUrl: seriesepisodes.apiDetailUrl!),
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