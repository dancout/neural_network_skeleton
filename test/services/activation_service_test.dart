import 'package:flutter_test/flutter_test.dart';
import 'package:neural_network_skeleton/neural_network_skeleton.dart';

void main() {
  late ActivationService testObject;

  setUp(() async {
    testObject = ActivationService(
      normalizationService: FakeNormalizationService(),
    );
  });

  group('activitaion', () {
    test('returns 0 if threshold is not met', () async {
      const input = 0.5;
      const bias = 0.1;
      const weight = 0.1;
      const threshold = (input * weight + bias) + 0.01;
      const perceptron = Perceptron(
        bias: bias,
        threshold: threshold,
        weightWeb: WeightWeb(
          weights: [weight],
        ),
      );
      const layerInputs = [input];

      final actual = testObject.activation(
        perceptron: perceptron,
        layerInputs: layerInputs,
      );

      const expected = 0.0;

      expect(actual, expected);
    });

    test('returns value if threshold is met', () async {
      const input = 0.5;
      const bias = 0.1;
      const weight = 0.1;
      const threshold = (input * weight + bias) - 0.01;
      const perceptron = Perceptron(
        bias: bias,
        threshold: threshold,
        weightWeb: WeightWeb(
          weights: [weight],
        ),
      );
      const layerInputs = [input];

      final actual = testObject.activation(
        perceptron: perceptron,
        layerInputs: layerInputs,
      );

      const expected = input * weight + bias;

      expect(actual, expected);
    });
  });

  group('weight calculations are done correctly - ', () {
    test('a', () async {
      const inputs = [1.0];
      const bias = 0.0;
      const weights = [1.0];
      const threshold = 0.0; // We always want an output
      const perceptron = Perceptron(
        bias: bias,
        threshold: threshold,
        weightWeb: WeightWeb(
          weights: weights,
        ),
      );
      const layerInputs = inputs;

      final actual = testObject.activation(
        perceptron: perceptron,
        layerInputs: layerInputs,
      );

      const expected = 1.0;

      expect(actual, expected);
    });

    test('b', () async {
      const inputs = [1.0, 1.0];
      const bias = 0.0;
      const weights = [0.25, 0.75];
      const threshold = 0.0; // We always want an output
      const perceptron = Perceptron(
        bias: bias,
        threshold: threshold,
        weightWeb: WeightWeb(
          weights: weights,
        ),
      );
      const layerInputs = inputs;

      final actual = testObject.activation(
        perceptron: perceptron,
        layerInputs: layerInputs,
      );

      const expected = 1.0;

      expect(actual, expected);
    });

    test('c', () async {
      const inputs = [0.25, 0.75];
      const bias = 0.0;
      const weights = [0.25, 0.75];
      const threshold = 0.0; // We always want an output
      const perceptron = Perceptron(
        bias: bias,
        threshold: threshold,
        weightWeb: WeightWeb(
          weights: weights,
        ),
      );
      const layerInputs = inputs;

      final actual = testObject.activation(
        perceptron: perceptron,
        layerInputs: layerInputs,
      );

      const expected = 0.625;

      expect(actual, expected);
    });

    test('d', () async {
      const inputs = [0.75, 0.25];
      const bias = 0.0;
      const weights = [0.25, 0.75];
      const threshold = 0.0; // We always want an output
      const perceptron = Perceptron(
        bias: bias,
        threshold: threshold,
        weightWeb: WeightWeb(
          weights: weights,
        ),
      );
      const layerInputs = inputs;

      final actual = testObject.activation(
        perceptron: perceptron,
        layerInputs: layerInputs,
      );

      const expected = 0.375;

      expect(actual, expected);
    });

    test('e', () async {
      const inputs = [0.75, 0.25, 0.5];
      const bias = 0.0;
      const weights = [0.25, 0.5, 0.75];
      const threshold = 0.0; // We always want an output
      const perceptron = Perceptron(
        bias: bias,
        threshold: threshold,
        weightWeb: WeightWeb(
          weights: weights,
        ),
      );
      const layerInputs = inputs;

      final actual = testObject.activation(
        perceptron: perceptron,
        layerInputs: layerInputs,
      );

      const expected = 0.6875;

      expect(actual, expected);
    });
  });

  group('bias is working properly', () {
    test('when bias is 0.25 and all other values are zero', () async {
      const inputs = [0.0, 0.0, 0.0];
      const bias = 0.25;
      const weights = [0.0, 0.0, 0.0];
      const threshold = 0.0; // We always want an output
      const perceptron = Perceptron(
        bias: bias,
        threshold: threshold,
        weightWeb: WeightWeb(
          weights: weights,
        ),
      );
      const layerInputs = inputs;

      final actual = testObject.activation(
        perceptron: perceptron,
        layerInputs: layerInputs,
      );

      expect(actual, bias);
    });

    test('when bias is 0.75 and all other values are zero', () async {
      const inputs = [0.0, 0.0, 0.0];
      const bias = 0.75;
      const weights = [0.0, 0.0, 0.0];
      const threshold = 0.0; // We always want an output
      const perceptron = Perceptron(
        bias: bias,
        threshold: threshold,
        weightWeb: WeightWeb(
          weights: weights,
        ),
      );
      const layerInputs = inputs;

      final actual = testObject.activation(
        perceptron: perceptron,
        layerInputs: layerInputs,
      );

      expect(actual, bias);
    });
  });

  group('weights', () {
    test('are respected', () async {
      final weightValues = List<double>.generate(10, (index) => index * 0.1);

      for (var weightValue in weightValues) {
        const inputs = [1.0, 1.0, 1.0];
        const bias = 0.0;
        final weights = [
          weightValue / 3,
          weightValue / 3,
          weightValue / 3,
        ];
        const threshold = 0.0; // We always want an output
        final perceptron = Perceptron(
          bias: bias,
          threshold: threshold,
          weightWeb: WeightWeb(
            weights: weights,
          ),
        );
        const layerInputs = inputs;

        final actual = testObject.activation(
          perceptron: perceptron,
          layerInputs: layerInputs,
        );

        final difference = (actual - weightValue).abs();
        expect(difference <= 0.000000001, isTrue);
      }
    });
  });
}

class FakeNormalizationService extends OutputNormalizationService {
  @override
  normalizeValue({required double value}) {
    return value;
  }
}
