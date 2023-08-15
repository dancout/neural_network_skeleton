import 'package:flutter_test/flutter_test.dart';
import 'package:neural_network_skeleton/models/weight_web.dart';

void main() {
  group('normalizeWeights', () {
    test('defaults to true', () async {
      final testObject = WeightWeb(
        weights: const [0.1, 0.1],
      );

      expect(testObject.normalizeWeights, isTrue);
    });

    test('when true ensures all weights add up to 1.0', () async {
      final List<List<double>> weightsList = [
        [0.1, 0.1],
        [0.7, 0.7],
        [0.7, 0.3],
        [1.0, 0.0],
        [2.0, 2.0],
        [1.5, 0.5],
      ];

      final List<List<double>> normalizeWeightsList = [
        [0.5, 0.5],
        [0.5, 0.5],
        [0.7, 0.3],
        [1.0, 0.0],
        [0.5, 0.5],
        [0.75, 0.25],
      ];

      for (int i = 0; i < weightsList.length; i++) {
        final weights = weightsList[i];
        final normalizedWeights = normalizeWeightsList[i];
        final testObject = WeightWeb(weights: weights);

        expect(testObject.weights, normalizedWeights);
      }
    });

    test('when false does not update the weights', () async {
      final List<List<double>> weightsList = [
        [0.1, 0.1],
        [0.7, 0.7],
        [0.7, 0.3],
        [1.0, 0.0],
        [2.0, 2.0],
        [1.5, 0.5],
      ];

      final List<List<double>> normalizeWeightsList = List.from(weightsList);

      for (int i = 0; i < weightsList.length; i++) {
        final weights = weightsList[i];
        final normalizedWeights = normalizeWeightsList[i];
        final testObject = WeightWeb(
          weights: weights,
          normalizeWeights: false,
        );

        expect(testObject.weights, normalizedWeights);
      }
    });
  });
}
