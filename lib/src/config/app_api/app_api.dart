class AppApi {
  static const String baseUrl = 'https://rest.coinapi.io';

  static const Map<String, dynamic> headers = {
    "Content-Type": "application/json",
    "X-CoinAPI-Key": apiKey,
  };

  static const String apiKey = "9A5F80B0-1FFB-4703-9F83-09F2B8202212";
}