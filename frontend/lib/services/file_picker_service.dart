import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FilePickerService {
  Future<File?> pickFile(List<String> allowedExtensions) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
      );

      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
      return null;
    } catch (e) {
      throw Exception('File picking failed: $e');
    }
  }

  Future<List<File>?> pickMultipleFiles(List<String> allowedExtensions) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        allowMultiple: true,
      );

      if (result != null) {
        return result.paths.map((path) => File(path!)).toList();
      }
      return null;
    } catch (e) {
      throw Exception('File picking failed: $e');
    }
  }
}
