import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neural_network_skeleton/neural_network_skeleton.dart';

import 'mocks.dart';

void main() {
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

    group('logical perceptrons', () {
      test('or test', () {
        const orPerceptron = Perceptron(
          bias: 0.0,
          threshold: 1.0,
          weightWeb: WeightWeb(weights: [1.0, 1.0]),
        );

        final neuralNetwork = NeuralNetwork(
          layers: const [
            PerceptronLayer(
              perceptrons: [
                orPerceptron,
              ],
            )
          ],
        );

        expect(neuralNetwork.guess(inputs: [0, 0]), [0.0]);
        expect(neuralNetwork.guess(inputs: [1, 0]), [1.0]);
        expect(neuralNetwork.guess(inputs: [0, 1]), [1.0]);
        expect(neuralNetwork.guess(inputs: [1, 1]), [1.0]);
      });

      test('and test', () async {
        const andPerceptron = Perceptron(
          bias: 0.0,
          threshold: 1.0,
          weightWeb: WeightWeb(
            weights: [0.5, 0.5],
          ),
        );

        final neuralNetwork = NeuralNetwork(
          layers: const [
            PerceptronLayer(
              perceptrons: [
                andPerceptron,
              ],
            )
          ],
        );

        expect(neuralNetwork.guess(inputs: [0, 0]), [0.0]);
        expect(neuralNetwork.guess(inputs: [1, 0]), [0.0]);
        expect(neuralNetwork.guess(inputs: [0, 1]), [0.0]);
        expect(neuralNetwork.guess(inputs: [1, 1]), [1.0]);
      });

      test('xor test', () async {
        const orPerceptron = Perceptron(
          bias: 0.0,
          threshold: 1.0,
          weightWeb: WeightWeb(weights: [1.0, 1.0]),
        );
        const andPerceptron = Perceptron(
          bias: 0.0,
          threshold: 1.0,
          weightWeb: WeightWeb(
            weights: [0.5, 0.5],
          ),
        );
        const notPerceptron = Perceptron(
          bias: 1.0,
          threshold: 0.0,
          weightWeb: WeightWeb(weights: [0.0, -1.0]),
        );
        const passthroughPerceptron = Perceptron(
          bias: 0.0,
          threshold: 0.0, // Sigmoid prevents 1.0
          weightWeb: WeightWeb(weights: [1.0, 0.0]),
        );

        final neuralNetwork = NeuralNetwork(layers: const [
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
        ]);

        expect(neuralNetwork.guess(inputs: [0, 0]), [0.0]);
        expect(neuralNetwork.guess(inputs: [1, 0]), [1.0]);
        expect(neuralNetwork.guess(inputs: [0, 1]), [1.0]);
        expect(neuralNetwork.guess(inputs: [1, 1]), [0.0]);
      });
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
