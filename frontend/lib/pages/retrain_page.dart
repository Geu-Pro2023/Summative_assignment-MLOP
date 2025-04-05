import 'package:flutter/material.dart';
import 'package:wildguard/constants/app_colors.dart';
import 'package:wildguard/constants/app_styles.dart';
import 'package:wildguard/models/training_model.dart';
import 'package:wildguard/widgets/custom_button.dart';
import 'package:wildguard/widgets/visualization_card.dart';

class RetrainPage extends StatefulWidget {
  const RetrainPage({super.key});

  @override
  State<RetrainPage> createState() => _RetrainPageState();
}

class _RetrainPageState extends State<RetrainPage> {
  bool _isLoading = false;
  TrainingModel? _trainingResult;

  void _retrainModel() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 3)).then((_) {
      setState(() {
        _trainingResult = TrainingModel(
          accuracy: 0.85 + (DateTime.now().millisecond % 100) / 1000,
          loss: 0.3 + (DateTime.now().millisecond % 200) / 1000,
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
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Model retrained successfully!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Improve the Model',
            style: headlineMedium,
          ),
          const SizedBox(height: 10),
          Text(
            'Click below to retrain the model with our latest dataset',
            style: bodyMedium,
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Instructions:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '1. Our system automatically collects new labeled data\n'
                  '2. Each retraining uses the latest conservation data\n'
                  '3. Minimum 50 images per class required',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: 'RETRAIN MODEL',
            onPressed: _isLoading ? () {} : _retrainModel,
            isLoading: _isLoading,
            backgroundColor: Colors.orange,
          ),
          const SizedBox(height: 30),
          if (_trainingResult != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Retraining Results',
                  style: headlineMedium,
                ),
                const SizedBox(height: 10),
                VisualizationCard(trainingResult: _trainingResult!),
              ],
            ),
        ],
      ),
    );
  }
}
