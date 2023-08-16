library neural_network_skeleton;

import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/perceptron.dart';
import 'package:neural_network_skeleton/models/perceptron_layer.dart';
import 'package:neural_network_skeleton/models/weight_web.dart';
import 'package:neural_network_skeleton/services/guess_service.dart';

// TODO: Clean this file up!

// The Coding Train example did NOT normalize the weights, and allowed them to be -1 to 1.
// You can do random() * 2 - 1 to get a random value between -1 and 1

class ExampleNeuralNetwork {
  List<double> run({
    required List<double> inputs,
  }) {
    final orPerceptron = Perceptron(
      bias: 0.0,
      threshold: 1.0,
      weightWeb: WeightWeb(weights: const [1.0, 1.0]),
    );

    final notPerceptron = Perceptron(
      bias: 1.0,
      threshold: 0.0,
      weightWeb: WeightWeb(weights: const [0.0, -1.0]),
    );

    final andPerceptron = Perceptron(
      bias: 0.0,
      threshold: 1.0,
      weightWeb: WeightWeb(
        weights: const [0.5, 0.5],
      ),
    );

    final passthroughPerceptron = Perceptron(
      bias: 0.0,
      threshold: 0.0, // Sigmoid prevents 1.0
      weightWeb: WeightWeb(weights: const [1.0, 0.0]),
    );

    final layers = [
      PerceptronLayer(
        perceptrons: [
          orPerceptron,
          andPerceptron,
        ],
      ),
      PerceptronLayer(
        perceptrons: [
          passthroughPerceptron,
          notPerceptron,
        ],
      ),
      PerceptronLayer(
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
    final orPerceptron = Perceptron(
      bias: 0.0,
      threshold: 1.0,
      weightWeb: WeightWeb(weights: const [1.0, 1.0]),
    );

    final layers = [
      PerceptronLayer(
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
    final andPerceptron = Perceptron(
      bias: 0.0,
      threshold: 1.0,
      weightWeb: WeightWeb(
        weights: const [0.5, 0.5],
      ),
    );

    final layers = [
      PerceptronLayer(
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
    final passthroughPerceptron = Perceptron(
      bias: 0.0,
      threshold: 0.0, // Sigmoid prevents 1.0
      weightWeb: WeightWeb(weights: const [1.0, 0.0]),
    );
    final layers = [
      PerceptronLayer(
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
    final notPerceptron = Perceptron(
      bias: 1.0,
      threshold: 0.0,
      weightWeb: WeightWeb(weights: const [0.0, -1.0]),
    );

    final layers = [
      PerceptronLayer(
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
