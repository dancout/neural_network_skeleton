import 'dart:math';

import 'package:neural_network_skeleton/neural_network_skeleton.dart';

class SigmoidNormalizationService extends OutputNormalizationService {
  @override
  normalizeValue({
    required double value,
  }) {
    return 1 / (1 + exp(-value));
  }
}
