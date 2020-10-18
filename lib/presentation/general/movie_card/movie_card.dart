import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';
import 'package:movies/domain/models/movie/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/presentation/general/details/details_screen.dart';
import 'package:movies/presentation/general/loader/loader.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    movie: movie,
                  ))),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: this.movie.posterPath,
                height: 200,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [moviesDefaultShadow],
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => Loader(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: moviesDefaultPadding / 2),
              child: Text(
                this.movie.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.yellow.shade100, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
