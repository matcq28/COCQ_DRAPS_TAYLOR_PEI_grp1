import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:comicapp/pages/detailsSeries/widgets/headerDSeries.dart';
import 'package:comicapp/pages/detailsSeries/widgets/fondSeries.dart';
import 'package:comicapp/pages/detailsSeries/widgets/histoireSeries.dart';
import 'package:comicapp/pages/detailsSeries/widgets/personnagesSeries.dart';
import 'package:comicapp/pages/detailsSeries/widgets/episodesSeries.dart';

class PageDetailsSeries extends StatefulWidget {
  final String apiDetailUrl;

  const PageDetailsSeries({Key? key, required this.apiDetailUrl}) : super(key: key);

  @override
  _PageDetailsfilmsState createState() => _PageDetailsfilmsState();
}

class _PageDetailsfilmsState extends State<PageDetailsSeries> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FondSeries(apiDetailUrl: widget.apiDetailUrl),
        HeaderDSeries(apiDetailUrl: widget.apiDetailUrl),
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
              _buildTabButton(0, 'Histoire'),
              _buildTabButton(1, 'Personnages'),
              _buildTabButton(2, 'Episodes'),
            ],
          ),
        ),
        
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: <Widget>[
              HistoireSeries(apiDetailUrl: widget.apiDetailUrl),
              PersonnagesSeries(apiDetailUrl: widget.apiDetailUrl),
              EpisodesSeries(apiDetailUrl: widget.apiDetailUrl),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(int index, String text) {
    Color color = _selectedIndex == index ? Colors.white : Colors.grey;

    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? 0.0 : 26.0),
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