import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSeries extends StatelessWidget {
  const HeaderSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 34.0,
      left: 32.0,
      child: Container(
        width: 290,
        height: 82,
        child: Text(
          "Séries les plus populaires",
          style: GoogleFonts.nunito(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}