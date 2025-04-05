import 'package:flutter/material.dart';
import 'package:wildguard/constants/app_colors.dart';
import 'package:wildguard/constants/app_styles.dart';
import 'package:wildguard/models/prediction_model.dart';

class PredictionCard extends StatelessWidget {
  final PredictionModel prediction;

  const PredictionCard({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    final isEndangered = prediction.predictedClass == 'Endangered';

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
              'Classification Result',
              style: headlineMedium.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isEndangered
                        ? Colors.orange.withOpacity(0.1)
                        : Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    prediction.predictedClass,
                    style: bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isEndangered ? Colors.orange : Colors.green,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '${prediction.confidence.toStringAsFixed(1)}%',
                  style: headlineMedium.copyWith(fontSize: 24),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: prediction.confidence / 100,
              backgroundColor: Colors.grey[200],
              color: isEndangered ? Colors.orange : Colors.green,
              minHeight: 8,
            ),
            const SizedBox(height: 8),
            Text(
              'Confidence Level',
              style: bodyMedium.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isEndangered
                    ? Colors.orange.withOpacity(0.05)
                    : Colors.green.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isEndangered
                      ? Colors.orange.withOpacity(0.2)
                      : Colors.green.withOpacity(0.2),
                ),
              ),
              child: Text(
                isEndangered
                    ? 'This animal is classified as endangered. '
                        'Consider reporting the sighting to conservation authorities.'
                    : 'This animal is classified as non-endangered. '
                        'Continue to monitor and protect all wildlife.',
                style: bodyMedium.copyWith(
                  color: isEndangered ? Colors.orange : Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
