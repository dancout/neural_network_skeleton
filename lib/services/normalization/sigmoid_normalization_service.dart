import 'dart:math';

import 'package:neural_network_skeleton/services/normalization/normalization_service.dart';

class SigmoidNormalizationService extends NormalizationService {
  @override
  normalizeValue({
    required double value,
  }) {
    return 1 / (1 + exp(-value));
  }
}
