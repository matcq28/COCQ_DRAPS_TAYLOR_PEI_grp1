import 'package:flutter/material.dart';

import 'package:comicapp/pages/accueil/widgets/header.dart';
import 'package:comicapp/pages/accueil/widgets/rectangleSeries.dart';
import 'package:comicapp/pages/accueil/widgets/rectangleComics.dart';
import 'package:comicapp/pages/accueil/widgets/rectangleFilms.dart';
import 'package:comicapp/main.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Header(),
        Positioned(
          top: 111,
          left: 9,
          right: 0,
          bottom: 0,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RectangleSeries(
                  onNavigateToSeriesPage: () {
                    final myAppState = context.findAncestorStateOfType<MyAppState>();
                    myAppState?.navigateToSeriesPage();
                  },
                ),
                SizedBox(height: 20),
                RectangleComics(
                  onNavigateToComicsPage: () {
                    final myAppState = context.findAncestorStateOfType<MyAppState>();
                    myAppState?.navigateToComicsPage();
                  },
                ),
                SizedBox(height: 20),
                RectangleFilms(
                  onNavigateToFilmsPage: () {
                    final myAppState = context.findAncestorStateOfType<MyAppState>();
                    myAppState?.navigateToFilmsPage();
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

