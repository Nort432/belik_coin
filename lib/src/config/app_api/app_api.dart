class AppApi {
  static const String baseUrl = 'https://rest.coinapi.io';

  static const Map<String, dynamic> headers = {
    "Content-Type": "application/json",
    "X-CoinAPI-Key": apiKey,
  };

  static const String apiKey = 'C6A1E74C-D3EB-4340-AB0E-58ADA3692C46';
}