class CoinParams {
  final String assetIdBase;
  final String assetIdQuote;

  const CoinParams({
    required this.assetIdBase,
    this.assetIdQuote = 'USD',
  });
}
