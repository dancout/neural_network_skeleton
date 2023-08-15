import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neural_network_skeleton/models/perceptron.dart';
import 'package:neural_network_skeleton/models/perceptron_layer.dart';
import 'package:neural_network_skeleton/models/weight_web.dart';
import 'package:neural_network_skeleton/services/guess_service.dart';
import 'package:neural_network_skeleton/src/neural_network.dart';

import 'mocks.dart';

void main() {
  const layers = [
    PerceptronLayer(
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
}
