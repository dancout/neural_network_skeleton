This package contains the components necessary to build a fully connected Neural Network using the Feed Forward algorithm. It lays out the barebones necessary for constructing a Neural Network that will output a set of values based on a given input.

## Basic Usage
#### Logical OR
```dart
const orPerceptron = Perceptron(
  bias: 0.0,
  threshold: 1.0,
  weights: [1.0, 1.0],
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

neuralNetwork.guess(inputs: [0.0, 0.0]); // [0.0]
neuralNetwork.guess(inputs: [1.0, 0.0]); // [1.0]
neuralNetwork.guess(inputs: [0.0, 1.0]); // [1.0]
neuralNetwork.guess(inputs: [1.0, 1.0]); // [1.0]
```

#### Logical AND & Logical XOR
Check the [example](https://github.com/dancout/nerual_network_skeleton/tree/main/example) folder

<img src="https://github.com/dancout/neural_network_skeleton/assets/5490028/7e4d06f2-1ec3-44c0-a7a4-4a866d0c3519" width="400">