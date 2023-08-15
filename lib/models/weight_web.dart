import 'package:equatable/equatable.dart';

class WeightWeb extends Equatable {
  WeightWeb({
    required List<double> weights,
    this.normalizeWeights = true,
  }) {
    _weights = List.from(weights);

    if (normalizeWeights) {
      final sum = _weights.reduce((value, element) => value + element);

      final factor = 1.0 / sum;

      for (int i = 0; i < _weights.length; i++) {
        _weights[i] *= factor;
      }
    }
  }

  List<double> get weights => _weights;

  // TODO: In the future we could consider making a special class called
  /// "Weight" that ensures the value is between 0 and 1.
  late final List<double> _weights;
  final bool normalizeWeights;

  @override
  List<Object?> get props => [
        _weights,
        normalizeWeights,
      ];
}
