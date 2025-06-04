import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomUploadImgWidget extends StatefulWidget {
  const CustomUploadImgWidget({super.key});

  @override
  State<CustomUploadImgWidget> createState() => _CustomUploadImgWidgetState();
}

class _CustomUploadImgWidgetState extends State<CustomUploadImgWidget> {
  List<XFile>? _mediaFileList = []; //<<---- list of images

  Future<void> _selectImages() async {
    final _picker = ImagePicker();
    final List<XFile>? pickedFileList = await _picker.pickMultiImage();
    if (pickedFileList != null && pickedFileList.isNotEmpty) {
      setState(() {
        _mediaFileList = pickedFileList;
      });
    }
    // setState(() {});
  }

  void _deleteimage(XFile image) {
    _mediaFileList!.remove(image);
    setState(() {});
  }

  //Agrege dependencia 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectImages();
      },
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Color.fromARGB(255, 238, 245, 238),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.file_upload_outlined, color: Colors.green, size: 100),
            Text(
              "Toca para agregar imagen",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 24,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
