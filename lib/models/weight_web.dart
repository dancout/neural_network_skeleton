import 'package:equatable/equatable.dart';

class WeightWeb extends Equatable {
  WeightWeb({
    required List<double> weights,
    this.normalizeWeights = false,
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

  late final List<double> _weights;

  /// Whether to proportionately update weights so that all add up to 1.0.
  ///
  /// This is intended to be used with only positive weight values.
  final bool normalizeWeights;

  @override
  List<Object?> get props => [
        _weights,
        normalizeWeights,
      ];
}
