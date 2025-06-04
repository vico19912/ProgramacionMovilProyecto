import 'package:flutter/material.dart';

class CustomUploadImgWidget extends StatefulWidget {
  const CustomUploadImgWidget({super.key});

  @override
  State<CustomUploadImgWidget> createState() => _CustomUploadImgWidgetState();
}

class _CustomUploadImgWidgetState extends State<CustomUploadImgWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("subir imagenes");
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
                color:Colors.green
              ), 
            ),
          ],
        ),
      ),
    );
  }
}
