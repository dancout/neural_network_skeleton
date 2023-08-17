part of 'package:neural_network_skeleton/neural_network_skeleton.dart';

/// Used to generate guesses on a [NueralNetwork].
class GuessService {
  GuessService({
    /// Used to generate outputs on given [Perceptron] objects.
    ActivationService? activationService,
  }) : _activationService = activationService ?? ActivationService();
  final ActivationService _activationService;

  /// Used to generate a guess based on the [inputs] and passed through the
  /// [layers].
  ///
  /// The [inputs] will be fed into the first [PerceptronLayer] found within
  /// [layers]. The outputs of that [PerceptronLayer] will then be used as the
  /// inputs for the next [PerceptronLayer], and so on.
  List<double> guess({
    required List<double> inputs,
    required List<PerceptronLayer> layers,
  }) {
    var layerInputs = List<double>.from(inputs);
    var layerOutputs = <double>[];

    for (var layer in layers) {
      layerOutputs = <double>[];
      for (var perceptron in layer.perceptrons) {
        final output = _activationService.activation(
          perceptron: perceptron,
          layerInputs: layerInputs,
        );
        layerOutputs.add(output);
      }
      layerInputs = List.from(layerOutputs);
    }

    return layerOutputs;
  }
}
