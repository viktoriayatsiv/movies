import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';
import 'package:movies/domain/models/movie/movie.dart';
import 'package:movies/presentation/general/details/components/genre_card.dart';

class GenresList extends StatelessWidget {
  final Movie movie;
  const GenresList(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: moviesDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie.genreList.length,
          itemBuilder: (context, index) => GenreCard(movie.genreList[index]),
        ),
      ),
    );
  }
}
