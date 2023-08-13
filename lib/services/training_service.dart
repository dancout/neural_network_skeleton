import 'package:neural_network_skeleton/models/perceptron_layer.dart';

/// The service responsible for training the Neural Network for improvements.
abstract class TrainingService {
  List<PerceptronLayer> train();
}
