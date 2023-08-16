import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/weight_web.dart';

/// The collection of [WeightWeb] objects each corresponding to an individual
/// [Perceptron] within a [PerceptronLayer].
///
/// There must be exactly one [WeightWeb] for each [Perceptron].
class WeightLayer extends Equatable {
  const WeightLayer({
    required this.weightWebs,
  });

  /// The [WeightWeb] objects corresponding to each [Perceptron] found in a
  /// [PerceptronLayer].
  final List<WeightWeb> weightWebs;

  @override
  List<Object?> get props => [
        weightWebs,
      ];
}
