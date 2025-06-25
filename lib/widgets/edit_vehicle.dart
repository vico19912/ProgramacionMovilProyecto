import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    millasController = TextEditingController(text: widget.vehicle['miles'].toString());
    anioController = TextEditingController(text: widget.vehicle['year'].toString());
    descripcionController = TextEditingController(text: widget.vehicle['desc']);
    precioController = TextEditingController(text: widget.vehicle['price'].toString());
  }

  @override
  void dispose() {
    millasController.dispose();
    anioController.dispose();
    descripcionController.dispose();
    precioController.dispose();
    super.dispose();
  }

  void saveChanges() {
    final updatedVehicle = {
      'marca': widget.vehicle['brand'], // no editable
      'modelo': widget.vehicle['model'], // no editable
      'imageUrl': widget.vehicle['imgUrl'],
      'millas': millasController.text,
      'anio': anioController.text,
      'descripcion': descripcionController.text,
      'precio': precioController.text,
    };
    Navigator.pop(context, updatedVehicle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar Catálogo'),
        centerTitle: true,
        backgroundColor: Color(0xFF417167),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Lógica para actualizar la foto
              },
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
