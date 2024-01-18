part of 'package:neural_network_skeleton/neural_network_skeleton.dart';

/// The collection of [Perceptron] objects within a single layer of a
/// [NeuralNetwork].
class PerceptronLayer extends Equatable {
  PerceptronLayer({
    required this.perceptrons,
  }) {
    assert(
      perceptrons.isNotEmpty,
      'perceptrons list cannot be empty within PerceptronLayer.',
    );
  }

  /// The collection of [Perceptron] objects within a [PerceptronLayer].
  final List<Perceptron> perceptrons;

  /// The number of [Perceptron] objects within this [PerceptronLayer].
  int get numPerceptrons => perceptrons.length;

  @override
  List<Object?> get props => [
        perceptrons,
      ];
}
