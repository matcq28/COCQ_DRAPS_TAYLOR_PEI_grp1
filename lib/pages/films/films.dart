import 'package:flutter/material.dart';

import 'package:comicapp/pages/films/widgets/headerFilms.dart';
import 'package:comicapp/pages/films/widgets/listFilms.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        HeaderFilms(),
        Positioned(
          top: 137,
          left: 8,
          right: 0,
          bottom: 0,
          child: ListFilms(),
        ),
      ],
    );
  }
}