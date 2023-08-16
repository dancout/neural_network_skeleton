import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/perceptron_layer.dart';

/// A collection of [PerceptronLayer] objects meant to be used within a
/// [NeuralNetwork].
class MultiLayerPerceptron extends Equatable {
  const MultiLayerPerceptron({
    required this.layers,
  });

  /// The [PerceptronLayer] objects within this [MultiLayerPerceptron].
  final List<PerceptronLayer> layers;

  @override
  List<Object?> get props => [
        layers,
      ];
}

extension MultiLayerPerceptronExtension on MultiLayerPerceptron {
  /// The number of [PerceptronLayer] objects within this
  /// [MultiLayerPerceptron].
  int get numLayers => layers.length;
}
