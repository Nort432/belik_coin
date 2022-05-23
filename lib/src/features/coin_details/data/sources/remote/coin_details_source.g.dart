// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_details_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _CoinDetailsSource implements CoinDetailsSource {
  _CoinDetailsSource(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://rest.coinapi.io';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<CoinModel>> fetchCoin(
      {required pathAssetIdBase, required pathAssetIdQuote}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': 'application/json',
      r'X-CoinAPI-Key': '9A5F80B0-1FFB-4703-9F83-09F2B8202212'
    };

    _headers.removeWhere((k, v) => v == null);

    final _data = <String, dynamic>{};

    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CoinModel>>(Options(
                method: 'GET',
                headers: _headers,
                extra: _extra,
                contentType: 'application/json')
            .compose(_dio.options,
                '/v1/exchangerate/${pathAssetIdBase}/${pathAssetIdQuote}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));

    final value = CoinModel.fromJson(_result.data!);

    final httpResponse = HttpResponse(value, _result);

    return httpResponse;
  }

  @override
  Future<HttpResponse<List<PriceHistoryModel>>> fetchPriceHistory(
      {required pathAssetIdBase,
      required pathAssetIdQuote,
      required queryPeriodId,
      required queryTimeStart,
      required queryTimeEnd}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'period_id': queryPeriodId,
      r'time_start': queryTimeStart,
      r'time_end': queryTimeEnd
    };
    try {
      final _headers = <String, dynamic>{
            r'Content-Type': 'application/json',
            r'X-CoinAPI-Key': '9A5F80B0-1FFB-4703-9F83-09F2B8202212'
          };

      _headers.removeWhere((k, v) => v == null);

      final _data = <String, dynamic>{};

      final _result = await _dio.fetch<List>(
              _setStreamType<HttpResponse<List<PriceHistoryModel>>>(Options(
            method: 'GET',
            headers: _headers,
            extra: _extra,
            contentType: 'application/json',
          )
                  .compose(
                    _dio.options,
                    '/v1/exchangerate/${pathAssetIdBase}/${pathAssetIdQuote}/history',
                    queryParameters: queryParameters,
                    data: _data,
                  )
                  .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));

      List<PriceHistoryModel> value = _result.data!
              .map((e) =>
              PriceHistoryModel.fromJson(e))
              .toList();
      final httpResponse = HttpResponse(value, _result);
      return httpResponse;
    } catch (e) {
      throw e.toString();
    }
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
