import 'package:flutter_test/flutter_test.dart';
import 'package:neural_network_skeleton/neural_network_skeleton.dart';

void main() {
  const perceptron = Perceptron(bias: 0.0, threshold: 0.0, weights: [1.0]);

  test('throws assertion error when empty perceptrons list', () async {
    expect(
      () => PerceptronLayer(perceptrons: const <Perceptron>[]),
      throwsAssertionError,
    );
  });

  test('numPerceptrons returns the length of the perceptrons list', () async {
    final perceptronsLists = List.generate(
      9,
      (index) => List.generate(
        index + 1, // Start at 1; No empty lists.
        (_) => perceptron,
      ),
    );

    for (var perceptrons in perceptronsLists) {
      final actual = PerceptronLayer(perceptrons: perceptrons).numPerceptrons;
      expect(actual, perceptrons.length);
    }
  });
}
