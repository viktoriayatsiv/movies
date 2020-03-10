class ApiLink {
  final String apiKey = '217a2cedaff0acb1d6b84e1d02d07ff8';
  final String apiPath = 'https://api.themoviedb.org/3/';

  String link;
  ApiLink({this.link});

  @override
  String toString() => apiPath + link + "?api_key=" + apiKey;
}
