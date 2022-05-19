class ApiCoinDetails {
  // https://rest.coinapi.io/v1/exchangerate/BTC/USD
  // https://rest.coinapi.io/v1/exchangerate/BTC/USD
  //        /history?period_id=1HRS
  //        &time_start=2022-05-16&time_end=2022-05-17

  static const String pathAssetIdBase = 'pathAssetIdBase';
  static const String pathAssetIdQuote = 'pathAssetIdQuote';

  static const String queryPeriodId = 'queryPeriodId';
  static const String queryTimeStart = 'queryTimeStart';
  static const String queryTimeEnd = 'queryTimeEnd';

  static const String urlCoin =
      '/v1/exchangerate/$pathAssetIdBase/$pathAssetIdQuote';

  static const String urlPriceHistory =
      '/v1/exchangerate/$pathAssetIdBase/$pathAssetIdQuote'
      '/history?period_id=$queryPeriodId'
      '&time_start=$queryTimeStart&time_end=$queryTimeEnd';
}
