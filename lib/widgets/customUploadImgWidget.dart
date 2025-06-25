import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class CustomUploadImgWidget extends StatefulWidget {
  const CustomUploadImgWidget({super.key});

  @override
  State<CustomUploadImgWidget> createState() => _CustomUploadImgWidgetState();
}

class _CustomUploadImgWidgetState extends State<CustomUploadImgWidget> {
  List<XFile>? _mediaFileList = []; //<<---- list of imagen

  Future<void> _selectImages() async {
    final _picker = ImagePicker();
    final List<XFile>? pickedFileList = await _picker.pickMultiImage();
    if (pickedFileList != null && pickedFileList.isNotEmpty) {
      setState(() {
        _mediaFileList = pickedFileList;
      });
    }
    setState(() {});
  }

  void _deleteimage(XFile image) {
    _mediaFileList!.remove(image);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (_mediaFileList != null && !_mediaFileList!.isNotEmpty)
      ? GestureDetector(
        onTap: () {
          _selectImages();
          print(_mediaFileList![0]);
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
              Icon(
                Icons.file_upload_outlined,
                color: Colors.green,
                size: 100,
              ),
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
      )
      : Container(
        decoration: BoxDecoration(
           color: Color.fromARGB(255, 238, 245, 238),
        ),
        height: 400, 
        width: 400,
        child: ReorderableGridView.count(
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 3,
          children: (_mediaFileList ?? []).map((e) => Image.file(File(e.path), key: ValueKey(e.path),)).toList(),
          onReorder: (oldIndex, newIndex) {
            setState(() {
              final element = _mediaFileList!.removeAt(oldIndex);
              _mediaFileList!.insert(newIndex, element);
            });
          },
        ),
      );
  }
}