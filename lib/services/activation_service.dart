import 'package:neural_network_skeleton/models/perceptron.dart';
import 'package:neural_network_skeleton/services/normalization/normalization_service.dart';
import 'package:neural_network_skeleton/services/normalization/sigmoid_normalization_service.dart';

class ActivationService {
  ActivationService({
    NormalizationService? normalizationService,
  }) : normalizationService =
            normalizationService ?? SigmoidNormalizationService();

  final NormalizationService normalizationService;

  double activation({
    required Perceptron perceptron,
    required List<double> layerInputs,
  }) {
    assert(perceptron.weightWeb.weights.length == layerInputs.length);

    final weightedInputs = <double>[];

    for (int i = 0; i < perceptron.weightWeb.weights.length; i++) {
      final weightedInput = perceptron.weightWeb.weights[i] * layerInputs[i];
      weightedInputs.add(weightedInput);
    }

    final weightedInputsSum =
        weightedInputs.reduce((value, element) => value + element);

    final weightedInputSumAndBias = normalizationService.normalizeValue(
      value: weightedInputsSum + perceptron.bias,
    );

    if (weightedInputSumAndBias > perceptron.threshold) {
      return weightedInputSumAndBias;
    } else {
      return 0.0;
    }
  }
}