import 'package:equatable/equatable.dart';

class WeightWeb extends Equatable {
  // TODO: Consider writing a test/assertion around the weights adding up to 1

  const WeightWeb({
    required this.weights,
  });

  // TODO: In the future we could consider making a special class called
  /// "Weight" that ensures the value is between 0 and 1.
  final List<double> weights;

  @override
  List<Object?> get props => [
        weights,
      ];
}
