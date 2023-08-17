part of 'package:neural_network_skeleton/neural_network_skeleton.dart';

/// Used to generate the output for a [Perceptron].
class ActivationService {
  ActivationService({
    /// Used to normalize the output value for a [Perceptron].
    OutputNormalizationService? normalizationService,
  }) : _normalizationService =
            normalizationService ?? ClampingOutputNormalizationService();

  final OutputNormalizationService _normalizationService;

  /// Returns the output for the given [perceptron].
  ///
  /// The [layerInputs] are multiplied by the weights found on the [perceptron]
  /// and are summed along with the bias found on the [perceptron]. If this sum
  /// is greater than the threshold found on the [perceptron], then that value
  /// is returned. Otherwise, 0.0 is returned.
  double activation({
    required Perceptron perceptron,
    required List<double> layerInputs,
  }) {
    // TODO: Write test on this assert
    assert(perceptron.weights.length == layerInputs.length);

    final weightedInputs = <double>[];

    for (int i = 0; i < perceptron.weights.length; i++) {
      final weightedInput = perceptron.weights[i] * layerInputs[i];
      weightedInputs.add(weightedInput);
    }

    final weightedInputsSum =
        weightedInputs.reduce((value, element) => value + element);

    final weightedInputSumAndBias = _normalizationService.normalizeValue(
      value: weightedInputsSum + perceptron.bias,
    );

    if (weightedInputSumAndBias >= perceptron.threshold) {
      return weightedInputSumAndBias;
    } else {
      return 0.0;
    }
  }
}
