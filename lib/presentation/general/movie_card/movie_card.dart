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
            Flexible(
              // fit: FlexFit.tight,
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
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.all(0),
              children: [
                RaisedButton(
                  child: Text('button'),
                  textColor: Colors.amber,
                  onPressed: () {
                    print('pressed');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
