import 'package:equatable/equatable.dart';
import 'package:neural_network_skeleton/models/weight_web.dart';

class WeightLayer extends Equatable {
  const WeightLayer({
    required this.weightWebs,
  });

  final List<WeightWeb> weightWebs;

  @override
  List<Object?> get props => [
        weightWebs,
      ];
}
