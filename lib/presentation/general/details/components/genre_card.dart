import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';

class GenreCard extends StatelessWidget {
  final String genre;
  const GenreCard(this.genre);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: moviesDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: moviesDefaultPadding,
        vertical: moviesDefaultPadding / 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple.shade400),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre,
        style: TextStyle(color: Colors.deepPurple.shade200, fontSize: 16),
      ),
    );
  }
}
