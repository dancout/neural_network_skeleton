import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/perceptron.dart';

class PerceptronLayer extends Equatable {
  const PerceptronLayer({
    required this.perceptrons,
  });

  final List<Perceptron> perceptrons;

  @override
  List<Object?> get props => [
        perceptrons,
      ];
}

extension LayerExtension on PerceptronLayer {
  int get numPerceptrons => perceptrons.length;
}
