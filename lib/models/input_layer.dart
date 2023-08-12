import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/input_web.dart';

class InputLayer extends Equatable {
  const InputLayer({
    required this.inputWebs,
  });

  final List<InputWeb> inputWebs;

  @override
  List<Object?> get props => [
        inputWebs,
      ];
}
