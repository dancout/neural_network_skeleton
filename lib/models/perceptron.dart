part of 'package:neural_network_skeleton/neural_network_skeleton.dart';

/// Represents a single [Perceptron] Node within a [NeuralNetwork].
class Perceptron extends Equatable {
  const Perceptron({
    required this.bias,
    required this.threshold,
    required this.weightWeb,
  });

  /// The value added to the internal activation function.
  ///
  /// This is meant to steer the perceptron in one direction or another. This
  /// way, if all weights in a Neural Network are 0 then the Perceptrons will
  /// still generate outputs.
  final double bias;

  /// The minimum value necessary for this [Perceptron] to output a value other
  /// than 0.
  final double threshold;

  /// The collection of weights to be multiplied against the collection of
  /// inputs coming into this [Perceptron].
  final WeightWeb weightWeb;

  @override
  List<Object?> get props => [
        bias,
        threshold,
        weightWeb,
      ];
}
