class TrainingModel {
  final double accuracy;
  final double loss;
  final List<List<int>> confusionMatrix;
  final Map<String, dynamic> classificationReport;
  final VisualizationData visualizations;

  TrainingModel({
    required this.accuracy,
    required this.loss,
    required this.confusionMatrix,
    required this.classificationReport,
    required this.visualizations,
  });

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      accuracy: json['accuracy'].toDouble(),
      loss: json['loss'].toDouble(),
      confusionMatrix: List<List<int>>.from(json['confusion_matrix']),
      classificationReport: json['classification_report'],
      visualizations: VisualizationData.fromJson(json['visualizations']),
    );
  }
}

class VisualizationData {
  final String accuracyPlot;
  final List<List<int>> confusionMatrix;
  final List<int> classDistribution;

  VisualizationData({
    required this.accuracyPlot,
    required this.confusionMatrix,
    required this.classDistribution,
  });

  factory VisualizationData.fromJson(Map<String, dynamic> json) {
    return VisualizationData(
      accuracyPlot: json['accuracy_plot'],
      confusionMatrix: List<List<int>>.from(json['confusion_matrix']),
      classDistribution: List<int>.from(json['class_distribution']),
    );
  }
}
