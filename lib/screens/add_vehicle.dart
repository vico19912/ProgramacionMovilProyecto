import 'package:image_picker/image_picker.dart';
import '../widgets/customBooleanDropdown.dart';
import '../widgets/customTextFormField.dart';
import '../widgets/customUploadImgWidget.dart';
import 'package:flutter/material.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final _formKey = GlobalKey<FormState>();

  final marcaController = TextEditingController();
  final modeloController = TextEditingController();
  final anioController = TextEditingController();
  final millasController = TextEditingController();
  final precioController = TextEditingController();
  final descripcionController = TextEditingController();

  bool? incluyeGluaController = false;
  bool? vendidoController = false;
  List<XFile>? _mediaFileList = [];

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

  void subirVehiculo() {
    if (_formKey.currentState!.validate()) {
      final newVehicle = {
        'marca': marcaController.text,
        'modelo': modeloController.text,
        'anio': anioController.text,
        'millas': millasController.text,
        'precio': 'Lps.${precioController.text}',
        'descripcion': descripcionController.text,
        'imageUrl': (_mediaFileList != null && _mediaFileList!.isNotEmpty)
            ? _mediaFileList!.first.path
            : 'https://via.placeholder.com/150',
        'incluyeGrua': incluyeGluaController,
        'vendido': vendidoController,
      };

      Navigator.pop(context, newVehicle); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agregar Vehículo",
          style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF417167),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/backgroundImg.png", fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    label: "Marca",
                    controller: marcaController,
                    validatorMsg: 'Por favor ingresa la marca',
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    label: "Modelo",
                    controller: modeloController,
                    validatorMsg: 'Por favor ingresa el modelo',
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          label: "Año",
                          controller: anioController,
                          validatorMsg: 'Ingresa el año',
                          keyboardType: TextInputType.number,
                          isNumber: true,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: CustomTextFormField(
                          label: "Millas",
                          controller: millasController,
                          validatorMsg: 'Ingresa las millas',
                          keyboardType: TextInputType.number,
                          isNumber: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    label: "Precio",
                    controller: precioController,
                    validatorMsg: 'Ingresa el precio',
                    keyboardType: TextInputType.number,
                    isNumber: true,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomBooleanDropdown(
                          initialValue: incluyeGluaController,
                          onChanged: (value) {
                            setState(() {
                              incluyeGluaController = value!;
                            });
                          },
                          label: 'Incluye Grúa',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomBooleanDropdown(
                          initialValue: vendidoController,
                          onChanged: (value) {
                            setState(() {
                              vendidoController = value!;
                            });
                          },
                          label: 'Estado Vendido',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    label: "Descripcion",
                    controller: descripcionController,
                    validatorMsg: "Ingrese Descripción",
                    maxLines: 4,
                  ),
                  SizedBox(height: 16),
                  CustomUploadImgWidget(
                    onImagesChanged: (imagenes) {
                      setState(() {
                        _mediaFileList = imagenes;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: subirVehiculo,
                    child: Text(
                      "Subir a la web",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
