import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neural_network_skeleton/neural_network_skeleton.dart';

import '../mocks.dart';
import '../test_utils.dart';

void main() {
  late ActivationService mockActivationService;
  late GuessService testObject;

  setUpAll(TestUtils.registerFallbacks);

  setUp(() async {
    mockActivationService = MockActivationService();
    testObject = GuessService(
      activationService: mockActivationService,
    );
  });

  group('guess', () {
    test('generates outputs properly with one layer', () async {
      final outputs = List<double>.generate(10, (index) => index * 0.1);

      for (var output in outputs) {
        const layerInputs = [0.1, 0.1, 0.1];
        const perceptron = Perceptron(
          bias: 0.1,
          threshold: 0.1,
          weights: [0.1, 0.1, 0.1],
        );

        when(
          () => mockActivationService.activation(
            perceptron: perceptron,
            layerInputs: layerInputs,
          ),
        ).thenReturn(output);

        final List<PerceptronLayer> layers = [
          PerceptronLayer(
            perceptrons: const [
              perceptron,
            ],
          ),
        ];

        final actual = testObject.guess(
          inputs: layerInputs,
          layers: layers,
        );

        final expected = [output];

        expect(actual, expected);
      }
    });

    test('generates outputs properly with multiple layers', () async {
      final outputs = List<double>.generate(10, (index) => index * 0.1);

      for (var output in outputs) {
        for (int i = 1; i < 10; i++) {
          const layerInputs = [0.1, 0.1, 0.1];

          const perceptron = Perceptron(
            bias: 0.1,
            threshold: 0.1,
            weights: [0.1, 0.1, 0.1],
          );

          final perceptronLayer = PerceptronLayer(
            perceptrons: const [
              perceptron,
              perceptron,
              perceptron,
            ],
          );

          final layers =
              List<PerceptronLayer>.generate(i, (index) => perceptronLayer);

          final List<double Function(Invocation)> removableOutputResponses =
              List.generate(
            layers.length * perceptronLayer.numPerceptrons,
            (index) => (_) => output,
          );

          // This is done so that we can return a different value each time
          // .activation is called.
          when(
            () => mockActivationService.activation(
              perceptron: any(named: 'perceptron'),
              layerInputs: any(named: 'layerInputs'),
            ),
          ).thenAnswer((_) => removableOutputResponses.removeAt(0)(_));

          final actual = testObject.guess(
            inputs: layerInputs,
            layers: layers,
          );

          final expected = List<double>.generate(
              perceptronLayer.numPerceptrons, (index) => output);

          expect(actual, expected);
        }
      }
    });
  });
}
