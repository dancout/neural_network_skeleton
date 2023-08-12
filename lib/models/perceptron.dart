import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/input.dart';

class Perceptron extends Equatable {
  const Perceptron({
    required this.bias,
    required this.threshold,
    required this.inputs,
  });

  final double bias;
  final double threshold;
  final List<Input> inputs;

  @override
  List<Object?> get props => [
        bias,
        threshold,
        inputs,
      ];
}
