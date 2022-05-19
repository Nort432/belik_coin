import 'package:equatable/equatable.dart';

class PriceHistoryEntity extends Equatable {
  final DateTime timeClose;
  final double rateClose;

  const PriceHistoryEntity({
    required this.timeClose,
    required this.rateClose,
  });

  @override
  List<Object> get props => [
        timeClose,
        rateClose,
      ];
}
