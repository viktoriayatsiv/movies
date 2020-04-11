// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_movies_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RemoteMoviesSource implements RemoteMoviesSource {
  _RemoteMoviesSource(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://api.themoviedb.org/3/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  fetchMoviesPage(apiKey) async {
    ArgumentError.checkNotNull(apiKey, 'apiKey');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'api_key': apiKey};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'trending/all/day',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MoviesPage.fromJson(_result.data);
    return Future.value(value);
  }
}
