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

  late final List<double> _weights;
  final bool normalizeWeights;

  @override
  List<Object?> get props => [
        _weights,
        normalizeWeights,
      ];
}
