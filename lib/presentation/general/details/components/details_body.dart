import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';
import 'package:movies/domain/models/movie/movie.dart';
import 'package:movies/presentation/general/details/components/poster_and_rating.dart';
import 'package:movies/presentation/general/details/components/genres_list.dart';
import 'package:movies/presentation/general/details/components/title_overview.dart';

class DetailsBody extends StatelessWidget {
  final Movie movie;

  const DetailsBody({this.movie});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PosterAndRating(size: size, movie: movie),
          GenresList(movie),
          TitleOverview(movie),
        ],
      ),
    );
  }
}
