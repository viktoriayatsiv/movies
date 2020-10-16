import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';
import 'package:movies/domain/models/movie/movie.dart';

class TitleOverview extends StatelessWidget {
  final Movie movie;
  const TitleOverview(this.movie);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: moviesDefaultPadding / 2,
            horizontal: moviesDefaultPadding,
          ),
          child: Text(
            movie.title,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        // overview
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: moviesDefaultPadding / 2,
            horizontal: moviesDefaultPadding,
          ),
          child: Text(
            "Description",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: moviesDefaultPadding),
          child: Text(
            movie.overview,
          ),
        ),
      ],
    );
  }
}
