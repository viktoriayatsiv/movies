import 'package:flutter/material.dart';
import 'package:movies/domain/models/movie/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/presentation/general/loader/loader.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            // Positioned(
            //   top: 0,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            //     decoration: BoxDecoration(
            //         color: Colors.lime,
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(8),
            //           bottomRight: Radius.circular(8),
            //         ) // green shaped
            //         ),
            //     child: Text(
            //       movie.genreList.join(','),
            //       style: TextStyle(color: Colors.deepPurpleAccent),
            //     ),
            //   ),
            // ),
            Flexible(
              fit: FlexFit.tight,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                placeholder: (context, url) => Loader(),
                imageUrl: this.movie.posterPath,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Text(
                this.movie.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
