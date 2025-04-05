import 'package:flutter/material.dart';
import 'package:wildguard/constants/app_colors.dart';
import 'package:wildguard/constants/app_styles.dart';
import 'package:wildguard/models/training_model.dart';

class VisualizationCard extends StatelessWidget {
  final TrainingModel trainingResult;

  const VisualizationCard({super.key, required this.trainingResult});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AppColors.cardBackground,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Model Performance',
              style: headlineMedium.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildMetricTile(
                  'Accuracy',
                  '${(trainingResult.accuracy * 100).toStringAsFixed(1)}%',
                  Colors.green,
                ),
                const SizedBox(width: 16),
                _buildMetricTile(
                  'Loss',
                  trainingResult.loss.toStringAsFixed(3),
                  Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Confusion Matrix',
              style: headlineMedium.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Confusion Matrix Visualization'),
                    const SizedBox(height: 8),
                    Text(
                      'True Endangered: ${trainingResult.confusionMatrix[0][0]}\n'
                      'False Non-Endangered: ${trainingResult.confusionMatrix[0][1]}\n'
                      'False Endangered: ${trainingResult.confusionMatrix[1][0]}\n'
                      'True Non-Endangered: ${trainingResult.confusionMatrix[1][1]}',
                      textAlign: TextAlign.center,
                      style: bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Class Distribution',
              style: headlineMedium.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildClassDistributionTile(
                    'Endangered',
                    trainingResult.visualizations.classDistribution[0],
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildClassDistributionTile(
                    'Non-Endangered',
                    trainingResult.visualizations.classDistribution[1],
                    Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricTile(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color.withOpacity(0.3),
          ),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: bodyMedium.copyWith(color: color),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: headlineMedium.copyWith(
                fontSize: 18,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClassDistributionTile(String label, int count, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: bodyMedium.copyWith(color: color),
          ),
          const SizedBox(height: 4),
          Text(
            count.toString(),
            style: headlineMedium.copyWith(
              fontSize: 18,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
