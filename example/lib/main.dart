// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:neural_network_skeleton/neural_network_skeleton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<List<double>> inputsList = [
      [0.0, 0.0],
      [1.0, 0.0],
      [0.0, 1.0],
      [1.0, 1.0],
    ];

    // ============ LOGICAL OR NEURAL NETWORK ==================================
    const orPerceptron = Perceptron(
      bias: 0.0,
      threshold: 1.0,
      weightWeb: WeightWeb(weights: [1.0, 1.0]),
    );

    final orNeuralNetwork = NeuralNetwork(
      layers: const [
        PerceptronLayer(
          perceptrons: [
            orPerceptron,
          ],
        )
      ],
    );

    print('\n');
    print('===== Logical OR =====');
    print('  Inputs   | Outputs');
    for (List<double> inputs in inputsList) {
      final output = orNeuralNetwork.guess(inputs: inputs);

      print('$inputs |  $output');
    }

    // ============ LOGICAL AND NEURAL NETWORK =================================
    const andPerceptron = Perceptron(
      bias: 0.0,
      threshold: 1.0,
      weightWeb: WeightWeb(
        weights: [0.5, 0.5],
      ),
    );

    final andNeuralNetwork = NeuralNetwork(
      layers: const [
        PerceptronLayer(
          perceptrons: [
            andPerceptron,
          ],
        )
      ],
    );

    print('\n');
    print('===== Logical AND =====');
    print('  Inputs   | Outputs');
    for (List<double> inputs in inputsList) {
      final output = andNeuralNetwork.guess(inputs: inputs);

      print('$inputs |  $output');
    }

    // ============ LOGICAL XOR NEURAL NETWORK =================================
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

    final xorNeuralNetwork = NeuralNetwork(layers: const [
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

    print('\n');
    print('===== Logical XOR =====');
    print('  Inputs   | Outputs');
    for (List<double> inputs in inputsList) {
      final output = xorNeuralNetwork.guess(inputs: inputs);

      print('$inputs |  $output');
    }

    return const Scaffold(
      body: Center(
        child: Text('Check your print statements'),
      ),
    );
  }
}
