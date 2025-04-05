import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class ImageService {
  static const String _baseUrl =
      'http://your-api-url.com'; // Replace with your API URL
  static const String _predictEndpoint = '/predict';
  static const String _retrainEndpoint = '/retrain';

  // Singleton pattern
  static final ImageService _instance = ImageService._internal();
  factory ImageService() => _instance;
  ImageService._internal();

  /// Compresses image file to reduce upload size
  Future<File?> compressImage(File file) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final targetPath =
          '${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg';

      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: 80,
        minWidth: 800,
        minHeight: 800,
      );

      return result != null ? File(result.path) : null;
    } catch (e) {
      debugPrint('Image compression error: $e');
      return null;
    }
  }

  /// Predicts if animal is endangered from image
  Future<Map<String, dynamic>> predictEndangeredStatus(File imageFile) async {
    try {
      // Compress image first
      final compressedFile = await compressImage(imageFile);
      if (compressedFile == null) throw Exception('Image compression failed');

      var request =
          http.MultipartRequest('POST', Uri.parse('$_baseUrl$_predictEndpoint'))
            ..files.add(await http.MultipartFile.fromPath(
              'image',
              compressedFile.path,
              contentType: MediaType('image', 'jpeg'),
            ));

      final response = await request.send();
      final responseData = await response.stream.bytesToString();

      if (response.statusCode != 200) {
        throw Exception('Prediction failed: ${response.reasonPhrase}');
      }

      return json.decode(responseData);
    } catch (e) {
      debugPrint('Prediction error: $e');
      rethrow;
    }
  }

  /// Uploads training data zip and triggers retraining
  Future<Map<String, dynamic>> retrainModel(File zipFile) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('$_baseUrl$_retrainEndpoint'))
            ..files.add(await http.MultipartFile.fromPath(
              'training_data',
              zipFile.path,
              contentType: MediaType('application', 'zip'),
            ));

      final response = await request.send();
      final responseData = await response.stream.bytesToString();

      if (response.statusCode != 200) {
        throw Exception('Retraining failed: ${response.reasonPhrase}');
      }

      return json.decode(responseData);
    } catch (e) {
      debugPrint('Retraining error: $e');
      rethrow;
    }
  }

  /// Downloads visualization images from API
  Future<Uint8List> getVisualizationImage(String type) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/visualize?type=$type'),
        headers: {'Accept': 'image/png'},
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to load visualization: ${response.reasonPhrase}');
      }

      return response.bodyBytes;
    } catch (e) {
      debugPrint('Visualization error: $e');
      rethrow;
    }
  }

  /// Gets class distribution data
  Future<Map<String, dynamic>> getClassDistribution() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/class_distribution'),
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to get class distribution: ${response.reasonPhrase}');
      }

      return json.decode(response.body);
    } catch (e) {
      debugPrint('Class distribution error: $e');
      rethrow;
    }
  }
}
