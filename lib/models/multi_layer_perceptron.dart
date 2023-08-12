import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/layer.dart';

class MultiLayerPerceptron extends Equatable {
  const MultiLayerPerceptron({
    required this.layers,
  });

  final List<PerceptronLayer> layers;

  @override
  List<Object?> get props => [
        layers,
      ];
}

extension MultiLayerPerceptronExtension on MultiLayerPerceptron {
  int get numLayers => layers.length;
}
