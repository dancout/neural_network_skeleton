import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/input.dart';

class InputWeb extends Equatable {
  const InputWeb({
    required this.inputs,
  });

  final List<Input> inputs;

  @override
  List<Object?> get props => [
        inputs,
      ];
}
