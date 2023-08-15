import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/weight_web.dart';

class Perceptron extends Equatable {
  const Perceptron({
    required this.bias,
    required this.threshold,
    required this.weightWeb,
  });

  final double bias;
  final double threshold;
  final WeightWeb weightWeb;

  @override
  List<Object?> get props => [
        bias,
        threshold,
        weightWeb,
      ];
}
