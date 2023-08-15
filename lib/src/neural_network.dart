import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/perceptron_layer.dart';
import 'package:neural_network_skeleton/services/guess_service.dart';

/// Represents a NueralNetwork that can generate geusses and be trained for
/// improvement.
class NeuralNetwork extends Equatable {
  NeuralNetwork({
    required this.layers,
    GuessService? guessService,
  }) : guessService = guessService ?? GuessService();

  final List<PerceptronLayer> layers;
  final GuessService guessService;

  List<double> guess({
    required List<double> inputs,
  }) {
    return guessService.guess(
      inputs: inputs,
      layers: layers,
    );
  }

  @override
  List<Object?> get props => [
        layers,
        guessService,
      ];
}
