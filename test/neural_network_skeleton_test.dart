import 'package:flutter_test/flutter_test.dart';
import 'package:neural_network_skeleton/neural_network_skeleton.dart';

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
}
