import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_20_start/config/cloudinary_config.dart';

class CloudinaryService {
  Future<String?> uploadImage(File imageFile) async {
    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/${CloudinaryConfig.cloudName}/image/upload',
    );
    var request = http.MultipartRequest("POST", url);

    // Optional: agar preset use kar rahe ho
    // request.fields['upload_preset'] = 'ml_default';

    request.files.add(
      await http.MultipartFile.fromPath('file', imageFile.path),
    );

    var response = await request.send();
    var responseData = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      var data = json.decode(responseData);
      return data['secure_url'];
    } else {
      print("Cloudinary Upload Failed: $responseData");
      return null;
    }
  }
}
