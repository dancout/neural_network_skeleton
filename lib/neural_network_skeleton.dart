library neural_network_skeleton;

import 'package:equatable/equatable.dart';

part 'package:neural_network_skeleton/models/perceptron.dart';
part 'package:neural_network_skeleton/models/perceptron_layer.dart';
part 'package:neural_network_skeleton/services/activation_service.dart';
part 'package:neural_network_skeleton/services/guess_service.dart';
part 'package:neural_network_skeleton/services/output_normalization/clamping_output_normalization_service.dart';
part 'package:neural_network_skeleton/services/output_normalization/output_normalization_service.dart';

/// Represents a NueralNetwork that can generate guesses based on given inputs.
class NeuralNetwork extends Equatable {
  NeuralNetwork({
    required this.layers,

    /// Used to generate a guess output for this [NeuralNetwork].
    GuessService? guessService,
  }) : _guessService = guessService ?? GuessService();

  /// The collection of [PerceptronLayers] that make up this [NeuralNetwork].
  final List<PerceptronLayer> layers;
  final GuessService _guessService;

  /// Generates the outputs for this [NeuralNetwork] based on the given
  /// [inputs].
  ///
  /// The [GuessService] is used for this calculation.
  List<double> guess({
    required List<double> inputs,
  }) {
    return _guessService.guess(
      inputs: inputs,
      layers: layers,
    );
  }

  @override
  List<Object?> get props => [
        layers,
        _guessService,
      ];
}
