library neural_network_skeleton;

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'neural_network_skeleton.g.dart';
part 'package:neural_network_skeleton/models/perceptron.dart';
part 'package:neural_network_skeleton/models/perceptron_layer.dart';
part 'package:neural_network_skeleton/services/activation_service.dart';
part 'package:neural_network_skeleton/services/guess_service.dart';
part 'package:neural_network_skeleton/services/output_normalization/clamping_output_normalization_service.dart';
part 'package:neural_network_skeleton/services/output_normalization/output_normalization_service.dart';

/// Represents a NueralNetwork that can generate guesses based on given inputs.
@JsonSerializable()
class NeuralNetwork extends Equatable {
  NeuralNetwork({
    required this.layers,

    /// Used to generate a guess output for this [NeuralNetwork].
    GuessService? guessService,
  }) : guessService = guessService ?? GuessService();

  /// The collection of [PerceptronLayers] that make up this [NeuralNetwork].
  final List<PerceptronLayer> layers;
  @JsonKey(
    toJson: _guessServiceToJson,
    fromJson: _guessServiceFromJson,
  )
  final GuessService guessService;

  /// Generates the outputs for this [NeuralNetwork] based on the given
  /// [inputs].
  ///
  /// The [GuessService] is used for this calculation.
  List<double> guess({
    required List<double> inputs,
  }) {
    return guessService.guess(
      inputs: inputs,
      layers: layers,
    );
  }

  @override
  List<Object?> get props => [
        layers,
        guessService,
      ];

  /// Converts the input [json] into a [NeuralNetwork] object.
  factory NeuralNetwork.fromJson(Map<String, dynamic> json) =>
      _$NeuralNetworkFromJson(json);

  /// Converts the [NeuralNetwork] object to JSON.
  Map<String, dynamic> toJson() => _$NeuralNetworkToJson(this);

  // TODO: Consider building out a way to parse GuessService, if possible.
  static _guessServiceToJson(GuessService guessService) => null;
  static _guessServiceFromJson(dynamic guessService) => null;
}
