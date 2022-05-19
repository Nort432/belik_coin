class PriceHistoryParams {
  final String assetIdBase;
  final String assetIdQuote;
  final String periodId;
  final String timeStart;
  final String timeEnd;

  const PriceHistoryParams({
    required this.assetIdBase,
    this.assetIdQuote = 'USD',
    required this.periodId,
    required this.timeStart,
    required this.timeEnd,
  });
}
