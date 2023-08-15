import 'package:mocktail/mocktail.dart';
import 'package:neural_network_skeleton/models/perceptron.dart';
import 'package:neural_network_skeleton/models/weight_web.dart';

class TestUtils {
  static void registerFallbacks() {
    registerFallbackValue(
      Perceptron(
        bias: 0.1,
        threshold: 0.1,
        weightWeb: WeightWeb(
          weights: const [0.1],
        ),
      ),
    );
  }
}