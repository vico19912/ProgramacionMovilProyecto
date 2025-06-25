import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditVehicle extends StatefulWidget {
  final Map<String, dynamic> vehicle;

  const EditVehicle({super.key, required this.vehicle});

  @override
  _EditVehicleState createState() => _EditVehicleState();
}

class _EditVehicleState extends State<EditVehicle> {
  late TextEditingController millasController;
  late TextEditingController anioController;
  late TextEditingController descripcionController;
  late TextEditingController precioController;

  String? imagePath;

  @override
  void initState() {
    super.initState();
    millasController = TextEditingController(text: widget.vehicle['miles'].toString());
    anioController = TextEditingController(text: widget.vehicle['year'].toString());
    descripcionController = TextEditingController(text: widget.vehicle['desc']);
    precioController = TextEditingController(text: widget.vehicle['price'].toString());
    imagePath = widget.vehicle['imgUrl'][0];
  }

  @override
  void dispose() {
    millasController.dispose();
    anioController.dispose();
    descripcionController.dispose();
    precioController.dispose();
    super.dispose();
  }

  Future<void> actualizarFoto() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }

  void saveChanges() {
    final updatedVehicle = {
      'brand': widget.vehicle['brand'],
      'model': widget.vehicle['model'],
      'imgUrl'[0]: imagePath ?? widget.vehicle['imgUrl'][0],
      'miles': millasController.text,
      'year': anioController.text,
      'desc': descripcionController.text,
      'price': precioController.text,
    };
    Navigator.pop(context, updatedVehicle);
  }

  @override
  Widget build(BuildContext context) {
    final bool isLocalImage = imagePath != null && !imagePath!.startsWith('http');

    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar Catálogo'),
        centerTitle: true,
        backgroundColor: Color(0xFF417167),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Foto del vehículo:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: imagePath == null
                  ? Icon(Icons.image, size: 80, color: Colors.grey)
                  : isLocalImage
                      ? Image.file(File(imagePath!), fit: BoxFit.cover)
                      : Image.network(imagePath!, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: actualizarFoto,
              child: Text('Actualizar foto'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: millasController,
              decoration: InputDecoration(labelText: 'Millas Recorridas'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: anioController,
              decoration: InputDecoration(labelText: 'Año'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
              maxLines: 2,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: precioController,
              decoration: InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: saveChanges,
              icon: Icon(Icons.save),
              label: Text('Guardar Cambios'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF417167),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
