import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PredictionProvider with ChangeNotifier {
  File? imageFile;
  String? predictionMessage;
  String? imageName;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      imageName = pickedFile.name;
      notifyListeners();
    }
  }

// Fungsi untuk mengirim gambar ke API dan mendapatkan prediksi
  Future<String?> predictImage() async {
    if (imageFile == null) 
      Text('image null');

    final csrfResponse = await http.get(Uri.parse('http://0.0.0.0:8000/api/get-csrf-token/'));
    final csrfToken = jsonDecode(csrfResponse.body)['csrfToken'];

    String? predictedClass;

    // Text(csrfToken);

    final url = Uri.parse(
        'http://0.0.0.0:8000/api/predict-image/'); // Ganti dengan URL API kamu
    final request = http.MultipartRequest('POST', url)
      ..headers['X-CSRFToken'] = csrfToken
      ..files.add(await http.MultipartFile.fromPath(
          'image', imageFile!.path)); // Pastikan field image sesuai
    // (Optional) Tambahkan header jika API memerlukannya
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      // 'Authorization': 'Bearer YOUR_TOKEN', // Tambahkan jika perlu
    });

    try {
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      print('Response status: ${response.statusCode}');
      print('Response body: $responseData');
      if (response.statusCode == 200) {
        final data = jsonDecode(responseData);

        if (data['predicted_class'] != null) {
          predictionMessage = 'Predicted class: ${data['predicted_class']}';
          predictedClass = data['predicted_class'];
        } else {
          predictionMessage = 'Prediction failed';
        }
      } else {
        // Jika error, tampilkan pesan error
        predictionMessage = 'Error ${response.statusCode}: $responseData';
      }
      notifyListeners();
    } catch (e) {
      predictionMessage = 'Error: $e';
      notifyListeners();
    }
    return predictedClass;
  }
  // Future<void> predictImage() async {
  //   if (imageFile == null) 
  //     Text('image null');

  //   final csrfResponse = await http.get(Uri.parse('http://192.168.1.7:8000/api/get-csrf-token/'));
  //   final csrfToken = jsonDecode(csrfResponse.body)['csrfToken'];

  //   // Text(csrfToken);

  //   final url = Uri.parse(
  //       'http://192.168.1.7:8000/api/predict-image/'); // Ganti dengan URL API kamu
  //   final request = http.MultipartRequest('POST', url)
  //     ..headers['X-CSRFToken'] = csrfToken
  //     ..files.add(await http.MultipartFile.fromPath(
  //         'image', imageFile!.path)); // Pastikan field image sesuai
  //   // (Optional) Tambahkan header jika API memerlukannya
  //   request.headers.addAll({
  //     'Content-Type': 'multipart/form-data',
  //     // 'Authorization': 'Bearer YOUR_TOKEN', // Tambahkan jika perlu
  //   });

  //   try {
  //     final response = await request.send();
  //     final responseData = await response.stream.bytesToString();
  //     print('Response status: ${response.statusCode}');
  //     print('Response body: $responseData');
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(responseData);

  //       if (data['predicted_class'] != null) {
  //         predictionMessage = 'Predicted class: ${data['predicted_class']}';
  //       } else {
  //         predictionMessage = 'Prediction failed';
  //       }
  //     } else {
  //       // Jika error, tampilkan pesan error
  //       predictionMessage = 'Error ${response.statusCode}: $responseData';
  //     }
  //     notifyListeners();
  //   } catch (e) {
  //     predictionMessage = 'Error: $e';
  //     notifyListeners();
  //   }
  // }

  // Future<String?> predictImage() async {
  //   if (imageFile == null) 
  //     Text('image null');

  //   final csrfResponse = await http.get(Uri.parse('http://192.168.1.7:8000/api/get-csrf-token/'));
  //   final csrfToken = jsonDecode(csrfResponse.body)['csrfToken'];

  //   String? predictedClass;

  //   // Text(csrfToken);

  //   final url = Uri.parse(
  //       'http://192.168.1.7:8000/api/predict-image/'); // Ganti dengan URL API kamu
  //   final request = http.MultipartRequest('POST', url)
  //     ..headers['X-CSRFToken'] = csrfToken
  //     ..files.add(await http.MultipartFile.fromPath(
  //         'image', imageFile!.path)); // Pastikan field image sesuai
  //   // (Optional) Tambahkan header jika API memerlukannya
  //   request.headers.addAll({
  //     'Content-Type': 'multipart/form-data',
  //     // 'Authorization': 'Bearer YOUR_TOKEN', // Tambahkan jika perlu
  //   });

  //   try {
  //     final response = await request.send();
  //     final responseData = await response.stream.bytesToString();
  //     print('Response status: ${response.statusCode}');
  //     print('Response body: $responseData');
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(responseData);

  //       if (data['predicted_class'] != null) {
  //         predictedClass = data['predicted_class'];
  //         // predictionMessage = 'Predicted class: ${data['predicted_class']}';
  //       } else {
  //         predictedClass = 'failed';
  //         // predictionMessage = 'Prediction failed';
  //       }
  //     } else {
  //       // Jika error, tampilkan pesan error
  //       predictedClass = '${response.statusCode}: $responseData';
  //       // predictionMessage = 'Error ${response.statusCode}: $responseData';
  //     }
  //     notifyListeners();
  //   } catch (e) {
  //     predictedClass = 'Error: $e';
  //     // predictionMessage = 'Error: $e';
  //     notifyListeners();
  //   }
  //   return predictedClass;
  // }

  // Fungsi untuk menghapus gambar dan prediksi
  void clear() {
    imageFile = null;
    predictionMessage = null;
    notifyListeners();
  }
}
