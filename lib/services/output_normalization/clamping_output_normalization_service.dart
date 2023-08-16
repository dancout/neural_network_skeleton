import 'package:neural_network_skeleton/services/output_normalization/output_normalization_service.dart';

class ClampingOutputNormalizationService extends OutputNormalizationService {
  @override
  normalizeValue({
    required double value,
  }) {
    return value.clamp(0.0, 1.0);
  }
}
