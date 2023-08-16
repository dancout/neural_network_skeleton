import 'package:neural_network_skeleton/services/normalization/normalization_service.dart';

class ClampingNormalizationService extends NormalizationService {
  @override
  normalizeValue({
    required double value,
  }) {
    return value.clamp(0.0, 1.0);
  }
}
