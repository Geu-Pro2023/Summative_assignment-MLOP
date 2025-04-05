import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:wildguard/models/prediction_model.dart';
import 'package:wildguard/models/training_model.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000'; // For emulator

  static Future<PredictionModel> predictImage(File image) async {
    final uri = Uri.parse('$baseUrl/predict');
    var request = http.MultipartRequest('POST', uri);

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        image.path,
        filename: image.path.split('/').last,
      ),
    );

    final response = await request.send();
    final responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return PredictionModel.fromJson(json.decode(responseString));
    } else {
      throw Exception('Failed to predict image: ${response.statusCode}');
    }
  }

  static Future<TrainingModel> retrainModel(File zipFile) async {
    final uri = Uri.parse('$baseUrl/retrain');
    var request = http.MultipartRequest('POST', uri);

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        zipFile.path,
        filename: zipFile.path.split('/').last,
      ),
    );

    final response = await request.send();
    final responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return TrainingModel.fromJson(json.decode(responseString));
    } else {
      throw Exception('Failed to retrain model: ${response.statusCode}');
    }
  }
}
