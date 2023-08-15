import 'package:neural_network_skeleton/models/perceptron_layer.dart';
import 'package:neural_network_skeleton/services/activation_service.dart';

class GuessService {
  GuessService({
    ActivationService? activationService,
  }) : activationService = activationService ?? ActivationService();
  final ActivationService activationService;

  // TODO: Should we make the output be of type <T> so that the user can specify
  /// whatever they want?

  List<double> guess({
    required List<double> inputs,
    required List<PerceptronLayer> layers,
  }) {
    var layerInputs = List<double>.from(inputs);
    var layerOutputs = <double>[];

    for (var layer in layers) {
      layerOutputs = <double>[];
      for (var perceptron in layer.perceptrons) {
        final output = activationService.activation(
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
