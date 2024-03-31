import 'package:flutter/material.dart';
import 'package:comicapp/pages/comics/widgets/headerComics.dart';
import 'package:comicapp/pages/comics/widgets/listComics.dart';

class ComicsPage extends StatelessWidget {
  const ComicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        HeaderComics(),
        Positioned(
          top: 137,
          left: 8,
          right: 0,
          bottom: 0,
          child: ListComics(),
        ),
      ],
    );
  }
}