class Movie {
  final int id;
  final String title;
  final bool adult;
  final String overview;
  final List<int> genreIds;
  final String originalTitle;
  final String originalLanguage;
  final String backdropPath;
  final String posterPath;
  final num popularity;
  final int voteCount;
  final num voteAverage;
  final bool video;

  Movie(
      {this.id,
      this.title,
      this.adult,
      this.overview,
      this.genreIds,
      this.originalTitle,
      this.originalLanguage,
      this.backdropPath,
      this.posterPath,
      this.popularity,
      this.voteCount,
      this.voteAverage,
      this.video});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['title'],
        adult: json['adult'],
        overview: json['overview'],
        // genreIds: json['genre_ids'],
        originalTitle: json['original_title'],
        originalLanguage: json['original_language'],
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        popularity: json['popularity'],
        voteCount: json['vote_count'],
        voteAverage: json['vote_average'],
        video: json['video']);
  }
}
