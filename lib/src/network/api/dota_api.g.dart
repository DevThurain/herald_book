// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dota_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _DotaAPI implements DotaAPI {
  _DotaAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.opendota.com/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<HeroVO>> getHeroList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<HeroVO>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/heroes',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => HeroVO.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<PlayerVO> getPlayerById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PlayerVO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/players/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PlayerVO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WinLoseVO> getWinLoseScore(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WinLoseVO>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/players/${id}/wl',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WinLoseVO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> getWordList(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/players/${id}/wordcloud',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<MatchVO>> getMatchList(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MatchVO>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/players/${id}/matches',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => MatchVO.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
