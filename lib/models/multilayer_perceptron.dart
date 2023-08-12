import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/weight_layer.dart';

class MultiLayerPerceptron extends Equatable {
  // TODO: Consider writing a test/assertion that the length of both lists match
  /// (so that they both represent 3 ayers or 4 layers), and that the
  /// weightLayers have the correct number of WeightWebs based on the number of
  /// perceptrons in that layer.

  const MultiLayerPerceptron({
    required this.perceptronCounts,
    required this.weightLayers,
  });

  final List<int> perceptronCounts;
  final List<WeightLayer> weightLayers;

  @override
  List<Object?> get props => [
        perceptronCounts,
        weightLayers,
      ];
}
