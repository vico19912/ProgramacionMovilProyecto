import 'dart:convert';
import 'package:http/http.dart' as http; 
import 'package:image_picker/image_picker.dart';

class CloudinaryService {
  final String _cloudName = 'dq11ivfeg';
  final String _uploadPreset = 'Importaciones_vehicles';

  CloudinaryService();

  Future<List<String>> uploadImagesAndGetUrl(List<XFile> imagesToUpload) async {
    List<String> imageUrls = []; // urls de las imágenes 

    // Generar un nombre único de carpeta basado en la fecha y hora
    final now = DateTime.now();
    final folderName ='${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}';

    for (XFile image in imagesToUpload) {
      final Uri url = Uri.parse('https://api.cloudinary.com/v1_1/$_cloudName/upload');
      final request = http.MultipartRequest('POST', url);

      request.fields['upload_preset'] = _uploadPreset;
      request.fields['folder'] = folderName;

      try {
        request.files.add(await http.MultipartFile.fromPath('file', image.path));

        final response = await request.send();

        if (response.statusCode == 200) {
          final resStr = await response.stream.bytesToString();
          final data = json.decode(resStr);
          imageUrls.add(data['secure_url']);
        } else {
          print('Error al subir imagen: ${response.statusCode}');
        }
      } catch (e) {
        print('Error al intentar subir la imagen: $e');
        return [];
      }
    }
    return imageUrls;
  }
}