// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neural_network_skeleton.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeuralNetwork _$NeuralNetworkFromJson(Map<String, dynamic> json) =>
    NeuralNetwork(
      layers: (json['layers'] as List<dynamic>)
          .map((e) => PerceptronLayer.fromJson(e as Map<String, dynamic>))
          .toList(),
      guessService: NeuralNetwork._guessServiceFromJson(json['guessService']),
    );

Map<String, dynamic> _$NeuralNetworkToJson(NeuralNetwork instance) =>
    <String, dynamic>{
      'layers': instance.layers,
      'guessService': NeuralNetwork._guessServiceToJson(instance.guessService),
    };

Perceptron _$PerceptronFromJson(Map<String, dynamic> json) => Perceptron(
      bias: (json['bias'] as num).toDouble(),
      threshold: (json['threshold'] as num).toDouble(),
      weights: (json['weights'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$PerceptronToJson(Perceptron instance) =>
    <String, dynamic>{
      'bias': instance.bias,
      'threshold': instance.threshold,
      'weights': instance.weights,
    };

PerceptronLayer _$PerceptronLayerFromJson(Map<String, dynamic> json) =>
    PerceptronLayer(
      perceptrons: (json['perceptrons'] as List<dynamic>)
          .map((e) => Perceptron.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PerceptronLayerToJson(PerceptronLayer instance) =>
    <String, dynamic>{
      'perceptrons': instance.perceptrons,
    };
