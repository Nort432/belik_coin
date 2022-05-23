class AppApi {
  static const String baseUrl = 'https://rest.coinapi.io';

  static const Map<String, dynamic> headers = {
    "Content-Type": "application/json",
    "X-CoinAPI-Key": apiKey,
  };

  // static const String apiKey = 'C6A1E74C-D3EB-4340-AB0E-58ADA3692C46';
  // static const String apiKey = "F792B90B-1CF3-44FA-AA5C-F30B080C30D9";
  static const String apiKey = "9A5F80B0-1FFB-4703-9F83-09F2B8202212";
}