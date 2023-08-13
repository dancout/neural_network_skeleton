import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/perceptron_layer.dart';
import 'package:neural_network_skeleton/services/guess_service.dart';
import 'package:neural_network_skeleton/services/training_service.dart';

/// Represents a NueralNetwork that can generate geusses and be trained for
/// improvement.
class NeuralNetwork extends Equatable {
  NeuralNetwork({
    required this.layers,
    required this.trainingService,
    GuessService? guessService,
  }) : guessService = guessService ?? GuessService();

  final List<PerceptronLayer> layers;
  final TrainingService trainingService;
  final GuessService guessService;

  List<double> guess() {
    return guessService.guess(layers: layers);
  }

  // TODO: This might not belong at this level. It is important for
  /// backpropagation, but NOT for genetic evolution (as the training happens
  /// during reproduction). Consider moving this out, and it might exist in the
  /// backpropagation example where this NeuralNetwork is extended or something.
  void train() {
    // TODO: Improve performance here. Could we update the list in place intead?
    layers.clear();
    layers.addAll(trainingService.train());
  }

  @override
  List<Object?> get props => [
        layers,
        guessService,
        trainingService,
      ];
}
