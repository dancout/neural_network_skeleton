import 'package:equatable/equatable.dart';

class WeightWeb extends Equatable {
  const WeightWeb({
    required this.weights,
  });

  final List<double> weights;

  @override
  List<Object?> get props => [
        weights,
      ];
}
