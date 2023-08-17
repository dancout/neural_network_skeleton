library neural_network_skeleton;

import 'package:equatable/equatable.dart';

part 'package:neural_network_skeleton/models/perceptron.dart';
part 'package:neural_network_skeleton/models/perceptron_layer.dart';
part 'package:neural_network_skeleton/models/weight_web.dart';
part 'package:neural_network_skeleton/services/activation_service.dart';
part 'package:neural_network_skeleton/services/guess_service.dart';
part 'package:neural_network_skeleton/services/output_normalization/clamping_output_normalization_service.dart';
part 'package:neural_network_skeleton/services/output_normalization/output_normalization_service.dart';

// TODO: Clean this file up!

// The Coding Train example did NOT normalize the weights, and allowed them to be -1 to 1.
// You can do random() * 2 - 1 to get a random value between -1 and 1

class ExampleNeuralNetwork {
  List<double> run({
    required List<double> inputs,
  }) {
    const orPerceptron = Perceptron(
      bias: 0.0,
      threshold: 1.0,
      weightWeb: WeightWeb(weights: [1.0, 1.0]),
    );

    const notPerceptron = Perceptron(
      bias: 1.0,
      threshold: 0.0,
      weightWeb: WeightWeb(weights: [0.0, -1.0]),
    );

    const andPerceptron = Perceptron(
      bias: 0.0,
      threshold: 1.0,
      weightWeb: WeightWeb(
        weights: [0.5, 0.5],
      ),
    );

    const passthroughPerceptron = Perceptron(
      bias: 0.0,
      threshold: 0.0, // Sigmoid prevents 1.0
      weightWeb: WeightWeb(weights: [1.0, 0.0]),
    );

    final layers = [
      const PerceptronLayer(
        perceptrons: [
          orPerceptron,
          andPerceptron,
        ],
      ),
      const PerceptronLayer(
        perceptrons: [
          passthroughPerceptron,
          notPerceptron,
        ],
      ),
      const PerceptronLayer(
        perceptrons: [
          andPerceptron,
        ],
      ),
    ];
    final neuralNetwork = NeuralNetwork(layers: layers);

    return neuralNetwork.guess(
      inputs: inputs,
    );
  }

  List<double> orTest({
    required List<double> inputs,
  }) {
    const orPerceptron = Perceptron(
      bias: 0.0,
      threshold: 1.0,
      weightWeb: WeightWeb(weights: [1.0, 1.0]),
    );

    final layers = [
      const PerceptronLayer(
        perceptrons: [
          orPerceptron,
        ],
      ),
    ];
    final neuralNetwork = NeuralNetwork(layers: layers);

    return neuralNetwork.guess(
      inputs: inputs,
    );
  }

  List<double> andTest({
    required List<double> inputs,
  }) {
    const andPerceptron = Perceptron(
      bias: 0.0,
      threshold: 1.0,
      weightWeb: WeightWeb(
        weights: [0.5, 0.5],
      ),
    );

    final layers = [
      const PerceptronLayer(
        perceptrons: [
          andPerceptron,
        ],
      ),
    ];
    final neuralNetwork = NeuralNetwork(layers: layers);

    return neuralNetwork.guess(
      inputs: inputs,
    );
  }

  List<double> passthroughTest({
    required List<double> inputs,
  }) {
    const passthroughPerceptron = Perceptron(
      bias: 0.0,
      threshold: 0.0, // Sigmoid prevents 1.0
      weightWeb: WeightWeb(weights: [1.0, 0.0]),
    );
    final layers = [
      const PerceptronLayer(
        perceptrons: [
          passthroughPerceptron,
        ],
      ),
    ];
    final neuralNetwork = NeuralNetwork(layers: layers);

    return neuralNetwork.guess(
      inputs: inputs,
    );
  }

  List<double> notTest({
    required List<double> inputs,
  }) {
    const notPerceptron = Perceptron(
      bias: 1.0,
      threshold: 0.0,
      weightWeb: WeightWeb(weights: [0.0, -1.0]),
    );

    final layers = [
      const PerceptronLayer(
        perceptrons: [
          notPerceptron,
        ],
      ),
    ];
    final neuralNetwork = NeuralNetwork(layers: layers);

    return neuralNetwork.guess(
      inputs: inputs,
    );
  }
}

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
