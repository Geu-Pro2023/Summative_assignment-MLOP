import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:wildguard/constants/app_colors.dart';
import 'package:wildguard/constants/app_styles.dart';
import 'package:wildguard/models/prediction_model.dart';
import 'package:wildguard/widgets/custom_button.dart';
import 'package:wildguard/widgets/prediction_card.dart';

class PredictPage extends StatefulWidget {
  const PredictPage({super.key});

  @override
  State<PredictPage> createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  Uint8List? _selectedImage;
  bool _isLoading = false;
  PredictionModel? _prediction;

  Future<void> _pickImage() async {
    final image = await ImagePickerWeb.getImageAsBytes();
    if (image != null) {
      setState(() {
        _selectedImage = image;
        _prediction = null;
      });
    }
  }

  Future<void> _predictImage() async {
    if (_selectedImage == null) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _prediction = PredictionModel(
        predictedClass: _getRandomPrediction(),
        confidence: _getRandomConfidence(),
        filename: 'uploaded_image.jpg',
      );
      _isLoading = false;
    });
  }

  String _getRandomPrediction() {
    return ['Endangered', 'Non-Endangered'][DateTime.now().second % 2];
  }

  double _getRandomConfidence() {
    return 70 + (DateTime.now().millisecond % 30);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Animal Classification',
            style: headlineMedium,
          ),
          const SizedBox(height: 10),
          Text(
            'Upload an image to check if the animal is endangered',
            style: bodyMedium,
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
              ),
              child: _selectedImage == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.image, size: 50, color: Colors.grey),
                        const SizedBox(height: 10),
                        Text(
                          'Tap to select an image',
                          style: bodyMedium,
                        ),
                      ],
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.memory(
                        _selectedImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'CLASSIFY IMAGE',
            onPressed: () {
              if (_selectedImage != null && !_isLoading) {
                _predictImage();
              }
            },
            isLoading: _isLoading,
          ),
          const SizedBox(height: 30),
          if (_prediction != null) PredictionCard(prediction: _prediction!),
        ],
      ),
    );
  }
}
