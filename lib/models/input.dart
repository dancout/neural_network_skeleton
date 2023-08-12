import 'package:equatable/equatable.dart';

class Input extends Equatable {
  const Input({
    required this.weight,
    required this.value,
  });

  final double weight;
  final double value;

  @override
  List<Object?> get props => [
        weight,
        value,
      ];
}
