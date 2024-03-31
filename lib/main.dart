import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:comicapp/pages/accueil/accueil.dart';
import 'package:comicapp/pages/comics/comics.dart';
import 'package:comicapp/pages/series/series.dart';
import 'package:comicapp/pages/films/films.dart';
import 'package:comicapp/pages/recherche/recherche.dart';

class AppColors {
  static const Color ArrPlanEcran = Color(0xFF15232E);
  static const Color Orange = Color(0xFFFF8100);
  static const Color ArrPlanCarte = Color(0xFF1E3243);
  static const Color ArrPlanElCarte = Color(0xFF284C6A);
  static const Color ArrPlanVoirPlus = Color(0xFF0F1921);
  static const Color ArrPlanBB = Color(0xFF0F1E2B);
  static const Color ArrPlanBBSelec = Color(0xFF12273C);
  static const Color TxtBBSelec = Color(0xFF3792FF);
  static const Color TxtBBNonSelec = Color(0xFF778BA8);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void navigateToSeriesPage() {
    setCurrentIndex(2);
  }

  void navigateToComicsPage() {
    setCurrentIndex(1);
  }

  void navigateToFilmsPage() {
    setCurrentIndex(3);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Comics',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.ArrPlanEcran,
        body: [
          Accueil(),
          ComicsPage(),
          SeriesPage(),
          FilmsPage(),
          Recherche(),
        ][_currentIndex],
        bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setCurrentIndex(index),
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.ArrPlanBB,
              selectedItemColor: AppColors.TxtBBSelec,
              unselectedItemColor: AppColors.TxtBBNonSelec,
              items: [
                _buildBottomNavigationBarItem(
                  icon: 'assets/SVG/navbar_home.svg',
                  label: 'Accueil',
                  index: 0,
                ),
                _buildBottomNavigationBarItem(
                  icon: 'assets/SVG/navbar_comics.svg',
                  label: 'Comics',
                  index: 1,
                ),
                _buildBottomNavigationBarItem(
                  icon: 'assets/SVG/navbar_series.svg',
                  label: 'Séries',
                  index: 2,
                ),
                _buildBottomNavigationBarItem(
                  icon: 'assets/SVG/navbar_movies.svg',
                  label: 'Films',
                  index: 3,
                ),
                _buildBottomNavigationBarItem(
                  icon: 'assets/SVG/navbar_search.svg',
                  label: 'Recherche',
                  index: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          icon,
          color: _currentIndex == index ? AppColors.TxtBBSelec : AppColors.TxtBBNonSelec,
        ),
      ),
      label: label,
    );
  }
}