class CoinNameEntity {
  static const String bitcoin = 'BTC';
  static const String ethereum = 'ETH';
  static const String dogecoin = 'DOGE';

   static List<String> id(String name) {
     switch(name) {
       case bitcoin:
         return ["COINBASE_SPOT_BTC_USD"];
       case ethereum:
         return ["COINBASE_SPOT_ETH_USD"];
       case dogecoin:
         return ["COINBASE_SPOT_DOGE_USD"];
     }
     return ["COINBASE_SPOT_BTC_USD"];
   }

  // final String bitcoinId = '"COINBASE_SPOT_BTC_USD"';
  // final String ethereumId = '"COINBASE_SPOT_ETH_USD"';
  // final String dogecoinId = '"COINBASE_SPOT_DOGE_USD"';
}