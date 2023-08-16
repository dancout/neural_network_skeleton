import 'package:neural_network_skeleton/services/output_normalization/output_normalization_service.dart';

/// Used to ensure output values for a [Perceptron] remain between 0.0 and 1.0,
/// inclusively.
class ClampingOutputNormalizationService extends OutputNormalizationService {
  @override
  normalizeValue({
    required double value,
  }) {
    return value.clamp(0.0, 1.0);
  }
}
