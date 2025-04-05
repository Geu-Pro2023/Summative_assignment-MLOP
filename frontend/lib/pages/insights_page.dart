import 'package:flutter/material.dart';
import 'package:wildguard/constants/app_assets.dart';
import 'package:wildguard/constants/app_styles.dart';
import 'package:wildguard/models/training_model.dart';
import 'package:wildguard/widgets/visualization_card.dart';

class InsightsPage extends StatelessWidget {
  const InsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final demoData = TrainingModel(
      accuracy: 0.87,
      loss: 0.38,
      confusionMatrix: [
        [120, 15],
        [20, 110],
      ],
      classificationReport: {
        'Endangered': {
          'precision': 0.86,
          'recall': 0.89,
          'f1-score': 0.87,
          'support': 135
        },
        'Non-Endangered': {
          'precision': 0.88,
          'recall': 0.85,
          'f1-score': 0.86,
          'support': 130
        },
      },
      visualizations: VisualizationData(
        accuracyPlot: '',
        confusionMatrix: [
          [120, 15],
          [20, 110],
        ],
        classDistribution: [135, 130],
      ),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Model Insights',
            style: headlineMedium,
          ),
          const SizedBox(height: 10),
          Text(
            'Performance metrics and visualizations of the classification model',
            style: bodyMedium,
          ),
          const SizedBox(height: 30),
          VisualizationCard(trainingResult: demoData),
          const SizedBox(height: 30),
          Text(
            'Feature Analysis',
            style: headlineMedium,
          ),
          const SizedBox(height: 15),
          _buildFeatureInsight(
            title: 'Color Patterns',
            description:
                'Endangered species often have more distinct patterns that make them identifiable to poachers',
            image: AppAssets.image1,
          ),
          const SizedBox(height: 20),
          _buildFeatureInsight(
            title: 'Habitat Background',
            description:
                'Images with natural habitats are more likely to be endangered species photographed in protected areas',
            image: AppAssets.image2,
          ),
          const SizedBox(height: 20),
          _buildFeatureInsight(
            title: 'Image Quality',
            description:
                'Higher quality images tend to be of non-endangered species as they are more commonly photographed in controlled environments',
            image: AppAssets.image3,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureInsight({
    required String title,
    required String description,
    required String image,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: bodyLarge.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: bodyMedium.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
