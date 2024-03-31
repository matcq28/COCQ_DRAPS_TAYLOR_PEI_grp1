import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:comicapp/pages/detailsFilms/widgets/headerDFilms.dart';
import 'package:comicapp/pages/detailsFilms/widgets/fondFilms.dart';
import 'package:comicapp/pages/detailsFilms/widgets/synopsisFilms.dart';
import 'package:comicapp/pages/detailsFilms/widgets/personnagesFilms.dart';
import 'package:comicapp/pages/detailsFilms/widgets/infosFilms.dart';

class PageDetailsfilms extends StatefulWidget {
  final String apiDetailUrl;

  const PageDetailsfilms({Key? key, required this.apiDetailUrl}) : super(key: key);

  @override
  _PageDetailsfilmsState createState() => _PageDetailsfilmsState();
}

class _PageDetailsfilmsState extends State<PageDetailsfilms> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FondFilms(apiDetailUrl: widget.apiDetailUrl),
        HeaderDFilms(apiDetailUrl: widget.apiDetailUrl),
        Positioned(
          top: 17,
          left: 10,
          child: IconButton(
            icon: Icon(Icons.chevron_left),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          top: 201,
          left: 21,
          child: Row(
            children: [
              _buildTabButton(0, 'Synopsis'),
              _buildTabButton(1, 'Personnages'),
              _buildTabButton(2, 'Infos'),
            ],
          ),
        ),
        
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: <Widget>[
              SynopsisFilms(apiDetailUrl: widget.apiDetailUrl),
              PersonnagesFilms(apiDetailUrl: widget.apiDetailUrl),
              InfosFilms(apiDetailUrl: widget.apiDetailUrl),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(int index, String text) {
    Color color = _selectedIndex == index ? Colors.white : Colors.grey;

    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? 0.0 : 33.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ),
    );
  }
}