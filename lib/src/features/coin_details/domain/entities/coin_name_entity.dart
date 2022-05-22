class CoinNameEntity {
  final String bitcoin = 'BTC';
  final String ethereum = 'ETH';
  final String dogecoin = 'DOGE';

   List<String> id(String name) {
     switch(name) {
       case 'COINBASE_SPOT_BTC_USD':
         return ["COINBASE_SPOT_BTC_USD"];
       case 'COINBASE_SPOT_ETH_USD':
         return ["COINBASE_SPOT_ETH_USD"];
       case 'COINBASE_SPOT_DOGE_USD':
         return ["COINBASE_SPOT_DOGE_USD"];
     }
     return ["COINBASE_SPOT_BTC_USD"];
   }

  // final String bitcoinId = '"COINBASE_SPOT_BTC_USD"';
  // final String ethereumId = '"COINBASE_SPOT_ETH_USD"';
  // final String dogecoinId = '"COINBASE_SPOT_DOGE_USD"';
}