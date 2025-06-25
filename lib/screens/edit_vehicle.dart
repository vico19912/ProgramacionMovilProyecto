import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../adapters/cloudinary.dart'; // tu servicio

class EditVehicle extends StatefulWidget {
  final Map<String, dynamic> vehicle;
  final String docId;

  const EditVehicle({super.key, required this.vehicle, required this.docId});

  @override
  _EditVehicleState createState() => _EditVehicleState();
}

class _EditVehicleState extends State<EditVehicle> {
  final _formKey = GlobalKey<FormState>();
  final cloudinaryService = CloudinaryService();

  // Controladores para los campos de texto
  late TextEditingController marcaController;
  late TextEditingController modeloController;
  late TextEditingController anioController;
  late TextEditingController millasController;
  late TextEditingController precioController;
  late TextEditingController descripcionController;

  // Campos booleanos
  bool incluyeGlua = false;
  bool vendido = false;

  // Imágenes: archivos locales y URLs Cloudinary
  List<XFile> _mediaFileList = [];
  List<String> _mediaFileListCloudinary = [];

  bool _isUploading = false;

  @override
  void initState() {
    super.initState();

    // Inicializa controladores con los datos existentes
    marcaController = TextEditingController(text: widget.vehicle['brand'] ?? '');
    modeloController = TextEditingController(text: widget.vehicle['model'] ?? '');
    anioController = TextEditingController(text: widget.vehicle['year']?.toString() ?? '');
    millasController = TextEditingController(text: widget.vehicle['miles']?.toString() ?? '');
    precioController = TextEditingController(text: widget.vehicle['price']?.toString() ?? '');
    descripcionController = TextEditingController(text: widget.vehicle['desc'] ?? '');

    // Inicializa booleanos 
    incluyeGlua = widget.vehicle['incluyeGlua'] ?? false;
    vendido = widget.vehicle['vendido'] ?? false;

    // Inicializa lista de URLs
    _mediaFileListCloudinary = List<String>.from(widget.vehicle['imgUrl'] ?? []);

    // No hay archivos locales al inicio
  }

  @override
  void dispose() {
    marcaController.dispose();
    modeloController.dispose();
    anioController.dispose();
    millasController.dispose();
    precioController.dispose();
    descripcionController.dispose();
    super.dispose();
  }

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        _mediaFileList.addAll(pickedFiles);
      });
    }
  }

  Future<void> saveChanges() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isUploading = true;
    });

    try {
      // Si hay imágenes nuevas locales, subirlas y agregar las URLs
      if (_mediaFileList.isNotEmpty) {
        final urls = await cloudinaryService.uploadImagesAndGetUrl(_mediaFileList);
        if (urls.isNotEmpty) {
          _mediaFileListCloudinary.addAll(urls);
          _mediaFileList.clear(); // Limpio las locales porque ya subí las imágenes
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al subir las imágenes')),
          );
          setState(() {
            _isUploading = false;
          });
          return;
        }
      }

      final updatedVehicle = {
        'brand': marcaController.text,
        'model': modeloController.text,
        'year': int.tryParse(anioController.text) ?? 0,
        'miles': int.tryParse(millasController.text) ?? 0,
        'price': double.tryParse(precioController.text) ?? 0.0,
        'desc': descripcionController.text,
        'incluyeGlua': incluyeGlua,
        'vendido': vendido,
        'imgUrl': _mediaFileListCloudinary,
      };

      await FirebaseFirestore.instance
          .collection('Cars')
          .doc(widget.docId)
          .update(updatedVehicle);

      Navigator.pop(context, true);
    } catch (e) {
      print('Error actualizando vehículo: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar el vehículo')),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  Widget buildImagePreview() {
    List<Widget> previews = [];

    // Imágenes que ya están en Cloudinary (URLs)
    for (var url in _mediaFileListCloudinary) {
      previews.add(Stack(
        children: [
          Image.network(url, width: 100, height: 100, fit: BoxFit.cover),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _mediaFileListCloudinary.remove(url);
                });
              },
              child: Container(
                color: Colors.black54,
                child: Icon(Icons.close, color: Colors.white),
              ),
            ),
          )
        ],
      ));
    }

    // Imágenes seleccionadas pero no subidas (locales)
    for (var file in _mediaFileList) {
      previews.add(Stack(
        children: [
          Image.file(File(file.path), width: 100, height: 100, fit: BoxFit.cover),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _mediaFileList.remove(file);
                });
              },
              child: Container(
                color: Colors.black54,
                child: Icon(Icons.close, color: Colors.white),
              ),
            ),
          )
        ],
      ));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: previews,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Vehículo'),
        backgroundColor: Color(0xFF417167),
        centerTitle: true,
      ),
      body: _isUploading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Marca'),
                    TextFormField(
                      controller: marcaController,
                      validator: (value) => value == null || value.isEmpty ? 'Requerido' : null,
                    ),
                    SizedBox(height: 10),

                    Text('Modelo'),
                    TextFormField(
                      controller: modeloController,
                      validator: (value) => value == null || value.isEmpty ? 'Requerido' : null,
                    ),
                    SizedBox(height: 10),

                    Text('Año'),
                    TextFormField(
                      controller: anioController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Requerido';
                        final year = int.tryParse(value);
                        if (year == null || year < 1900) return 'Año inválido';
                        return null;
                      },
                    ),
                    SizedBox(height: 10),

                    Text('Millas'),
                    TextFormField(
                      controller: millasController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Requerido';
                        if (int.tryParse(value) == null) return 'Número inválido';
                        return null;
                      },
                    ),
                    SizedBox(height: 10),

                    Text('Precio'),
                    TextFormField(
                      controller: precioController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Requerido';
                        if (double.tryParse(value) == null) return 'Número inválido';
                        return null;
                      },
                    ),
                    SizedBox(height: 10),

                    Text('Descripción'),
                    TextFormField(
                      controller: descripcionController,
                      maxLines: 3,
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Text('Incluye GLUA'),
                        Switch(
                          value: incluyeGlua,
                          onChanged: (val) {
                            setState(() {
                              incluyeGlua = val;
                            });
                          },
                        ),
                        SizedBox(width: 20),
                        Text('Vendido'),
                        Switch(
                          value: vendido,
                          onChanged: (val) {
                            setState(() {
                              vendido = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Text('Imágenes'),
                    SizedBox(height: 10),
                    buildImagePreview(),

                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: pickImages,
                      icon: Icon(Icons.add_a_photo),
                      label: Text('Agregar imágenes'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF417167),
                        minimumSize: Size(double.infinity, 40),
                      ),
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
            ),
    );
  }
}
