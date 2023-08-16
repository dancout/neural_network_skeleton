import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/perceptron.dart';

/// The collection of [Perceptron] objects within a single layer of a
/// [NeuralNetwork].
class PerceptronLayer extends Equatable {
  const PerceptronLayer({
    required this.perceptrons,
  });

  /// The collection of [Perceptron] objects within a [PerceptronLayer].
  final List<Perceptron> perceptrons;

  @override
  List<Object?> get props => [
        perceptrons,
      ];
}

extension LayerExtension on PerceptronLayer {
  /// The number of [Perceptron] objects within this [PerceptronLayer].
  int get numPerceptrons => perceptrons.length;
}
