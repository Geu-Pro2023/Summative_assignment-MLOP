class PredictionModel {
  final String predictedClass;
  final double confidence;
  final String filename;

  PredictionModel({
    required this.predictedClass,
    required this.confidence,
    required this.filename,
  });

  factory PredictionModel.fromJson(Map<String, dynamic> json) {
    return PredictionModel(
      predictedClass: json['predicted_class'],
      confidence: json['confidence'].toDouble(),
      filename: json['filename'],
    );
  }
}
