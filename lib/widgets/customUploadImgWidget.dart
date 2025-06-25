import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class CustomUploadImgWidget extends StatefulWidget {
  final Function(List<XFile>) onImagesChanged;

  const CustomUploadImgWidget({super.key, required this.onImagesChanged});

  @override
  State<CustomUploadImgWidget> createState() => _CustomUploadImgWidgetState();
}

class _CustomUploadImgWidgetState extends State<CustomUploadImgWidget> {
  List<XFile>? _mediaFileList = [];

  Future<void> _selectImages() async {
    final _picker = ImagePicker();
    final List<XFile>? pickedFileList = await _picker.pickMultiImage();
    if (pickedFileList != null && pickedFileList.isNotEmpty) {
      setState(() {
        _mediaFileList = pickedFileList;
        widget.onImagesChanged(_mediaFileList!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (_mediaFileList != null && _mediaFileList!.isEmpty)
      ? GestureDetector(
        onTap: _selectImages,
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
        decoration: BoxDecoration(color: Color.fromARGB(255, 238, 245, 238)),
        height: 400,
        width: 400,
        child: ReorderableGridView.count(
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 3,
          children:
              (_mediaFileList ?? []).map((e) {
                return Stack(
                  key: ValueKey(e.path),
                  children: [
                    Positioned.fill(
                      child: Image.file(File(e.path), fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: 4,
                      right: 5,
                      width: 25,
                      height: 25,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 18,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {
                            setState(() {
                              _mediaFileList!.remove(e);
                              widget.onImagesChanged(_mediaFileList!);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
          onReorder: (oldIndex, newIndex) {
            setState(() {
              final element = _mediaFileList!.removeAt(oldIndex);
              _mediaFileList!.insert(newIndex, element);
              widget.onImagesChanged(_mediaFileList!);
            });
          },
        ),
      );
  }
}