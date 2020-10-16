import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';
import 'package:movies/domain/models/movie/movie.dart';
import 'package:movies/presentation/general/loader/loader.dart';

class PosterAndRating extends StatelessWidget {
  const PosterAndRating({
    @required this.size,
    @required this.movie,
  });

  final Size size;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.5,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.5 - moviesDefaultPadding / 2,
            child: CachedNetworkImage(
              imageUrl: movie.posterPath,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50)),
                  boxShadow: [moviesDefaultShadow],
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => Loader(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          // Rating Box
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: moviesDefaultPadding * 5,
              height: moviesDefaultPadding * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [moviesDefaultShadow],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: moviesDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "${movie.voteAverage}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                  text: "/10",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.blueGrey)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Back Button
          SafeArea(child: BackButton()),
        ],
      ),
    );
  }
}
