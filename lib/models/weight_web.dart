part of 'package:neural_network_skeleton/neural_network_skeleton.dart';

/// The collection of weights to be multiplied against the collection of
/// inputs coming into a [Perceptron].
///
/// The [NeuralNetwork] is fully-connected, so there must be a weight value for
/// every [Perceptron] connection from one [PerceptronLayer] to another.
class WeightWeb extends Equatable {
  const WeightWeb({
    required this.weights,
  });

  /// The list of weights representing how strongly an input will influence the
  /// target [Perceptron].
  final List<double> weights;

  @override
  List<Object?> get props => [
        weights,
      ];
}
