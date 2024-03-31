import 'package:flutter/material.dart';

import 'package:comicapp/pages/series/widgets/headerSeries.dart';
import 'package:comicapp/pages/series/widgets/listSeries.dart';

class SeriesPage extends StatelessWidget {
  const SeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        HeaderSeries(),
        Positioned(
          top: 137,
          left: 8,
          right: 0,
          bottom: 0,
          child: ListSeries(),
        ),
      ],
    );
  }
}