part of 'package:neural_network_skeleton/neural_network_skeleton.dart';

/// Used to normalize output data from a [Perceptron].
///
/// This may be necessary if your algorithm requires all values to be within a
/// certain range. Otherwise, values could potentially grow or shrink
/// disproportionately as they feed forward within the [NeuralNetwork].
abstract class OutputNormalizationService {
  /// Returns a normalized output [value].
  double normalizeValue({required double value});
}
