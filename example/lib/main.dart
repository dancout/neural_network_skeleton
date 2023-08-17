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
    List<List<double>> logicalInputsList = [
      [0.0, 0.0],
      [1.0, 0.0],
      [0.0, 1.0],
      [1.0, 1.0],
    ];

    final List<Widget> textRows = [];

    // ============ LOGICAL OR NEURAL NETWORK ==================================
    const orPerceptron = Perceptron(
      bias: 0.0,
      threshold: 1.0,
      weights: [1.0, 1.0],
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

    textRows.add(const Text('===== Logical OR ====='));
    textRows.add(const Text('    Inputs       Outputs'));
    for (List<double> inputs in logicalInputsList) {
      final output = orNeuralNetwork.guess(inputs: inputs);

      textRows.add(Text('$inputs        $output'));
    }

    // ============ LOGICAL AND NEURAL NETWORK =================================
    const andPerceptron = Perceptron(
      bias: 0.0,
      threshold: 1.0,
      weights: [0.5, 0.5],
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

    textRows.add(const SizedBox(height: 24));
    textRows.add(const Text('===== Logical AND ====='));
    textRows.add(const Text('    Inputs       Outputs'));
    for (List<double> inputs in logicalInputsList) {
      final output = andNeuralNetwork.guess(inputs: inputs);

      textRows.add(Text('$inputs        $output'));
    }

    // ============ LOGICAL XOR NEURAL NETWORK =================================
    const notPerceptron = Perceptron(
      bias: 1.0,
      threshold: 0.0,
      weights: [0.0, -1.0],
    );
    const passthroughPerceptron = Perceptron(
      bias: 0.0,
      threshold: 0.0, // Sigmoid prevents 1.0
      weights: [1.0, 0.0],
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

    textRows.add(const SizedBox(height: 24));
    textRows.add(const Text('===== Logical XOR ====='));
    textRows.add(const Text('    Inputs       Outputs'));
    for (List<double> inputs in logicalInputsList) {
      final output = xorNeuralNetwork.guess(inputs: inputs);

      textRows.add(Text('$inputs        $output'));
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: textRows,
        ),
      ),
    );
  }
}
