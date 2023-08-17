import 'package:mocktail/mocktail.dart';
import 'package:neural_network_skeleton/neural_network_skeleton.dart';

class TestUtils {
  static void registerFallbacks() {
    registerFallbackValue(
      const Perceptron(
        bias: 0.1,
        threshold: 0.1,
        weightWeb: WeightWeb(
          weights: [0.1],
        ),
      ),
    );
  }
}
