import 'package:flutter/material.dart';
import 'package:movies/domain/models/movie/movie.dart';
import 'package:movies/presentation/general/details/components/details_body.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(movie: movie),
    );
  }
}
