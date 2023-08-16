import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neural_network_skeleton/models/perceptron.dart';
import 'package:neural_network_skeleton/models/perceptron_layer.dart';
import 'package:neural_network_skeleton/models/weight_web.dart';
import 'package:neural_network_skeleton/neural_network_skeleton.dart';
import 'package:neural_network_skeleton/services/guess_service.dart';

import 'mocks.dart';

void main() {
  test('xor test', () {
    final neuralNetwork = ExampleNeuralNetwork();

    expect(neuralNetwork.run(inputs: [0, 0]), [0.0]);
    expect(neuralNetwork.run(inputs: [1, 0]), [1.0]);
    expect(neuralNetwork.run(inputs: [0, 1]), [1.0]);
    expect(neuralNetwork.run(inputs: [1, 1]), [0.0]);
  });

  test('or test', () async {
    final neuralNetwork = ExampleNeuralNetwork();

    expect(neuralNetwork.orTest(inputs: [0, 0]), [0.0]);
    expect(neuralNetwork.orTest(inputs: [1, 0]), [1.0]);
    expect(neuralNetwork.orTest(inputs: [0, 1]), [1.0]);
    expect(neuralNetwork.orTest(inputs: [1, 1]), [1.0]);
  });

  test('and test', () async {
    final neuralNetwork = ExampleNeuralNetwork();

    expect(neuralNetwork.andTest(inputs: [0, 0]), [0.0]);
    expect(neuralNetwork.andTest(inputs: [1, 0]), [0.0]);
    expect(neuralNetwork.andTest(inputs: [0, 1]), [0.0]);
    expect(neuralNetwork.andTest(inputs: [1, 1]), [1.0]);
  });

  test('passthrough test', () async {
    final neuralNetwork = ExampleNeuralNetwork();

    expect(neuralNetwork.passthroughTest(inputs: [0, 0]), [0.0]);
    expect(neuralNetwork.passthroughTest(inputs: [1, 0]), [1.0]);
    expect(neuralNetwork.passthroughTest(inputs: [0, 1]), [0.0]);
    expect(neuralNetwork.passthroughTest(inputs: [1, 1]), [1.0]);
  });

  test('not test', () async {
    final neuralNetwork = ExampleNeuralNetwork();

    expect(neuralNetwork.notTest(inputs: [0, 0]), [1.0]);
    expect(neuralNetwork.notTest(inputs: [1, 0]), [1.0]);
    expect(neuralNetwork.notTest(inputs: [0, 1]), [0.0]);
    expect(neuralNetwork.notTest(inputs: [1, 1]), [0.0]);
  });

  group('NeuralNetwork', () {
    final layers = [
      const PerceptronLayer(
        perceptrons: [
          Perceptron(
            bias: 0.1,
            threshold: 0.1,
            weightWeb: WeightWeb(
              weights: [0.1, 0.1, 0.1],
            ),
          )
        ],
      )
    ];

    late GuessService mockGuessService;
    late NeuralNetwork testObject;

    setUp(() async {
      mockGuessService = MockGuessService();
      testObject = NeuralNetwork(
        layers: layers,
        guessService: mockGuessService,
      );
    });

    group('guess', () {
      test('returns proper output through GuessService', () async {
        final expected = [0.5, 0.6, 0.7];
        const inputs = [0.1, 0.2, 0.3];
        when(
          () => mockGuessService.guess(
            inputs: inputs,
            layers: layers,
          ),
        ).thenReturn(expected);

        final actual = testObject.guess(inputs: inputs);

        expect(actual, expected);
      });
    });
  });
}
