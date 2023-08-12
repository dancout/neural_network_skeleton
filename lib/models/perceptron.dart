import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/weight_web.dart';

class Perceptron extends Equatable {
  const Perceptron({
    required this.bias,
    required this.threshold,
    required this.weights,
  });

  final double bias;
  final double threshold;
  final List<WeightWeb> weights;

  @override
  List<Object?> get props => [
        bias,
        threshold,
        weights,
      ];
}
