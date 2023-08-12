import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/perceptron.dart';

class Layer extends Equatable {
  const Layer({
    required this.perceptrons,
  });

  final List<Perceptron> perceptrons;

  @override
  List<Object?> get props => [
        perceptrons,
      ];
}
