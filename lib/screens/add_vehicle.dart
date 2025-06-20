import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:programacion_movil_proyecto/model/Cars.dart';
import 'package:programacion_movil_proyecto/widgets/modal.dart';
//widgets
import '../widgets/customBooleanDropdown.dart';
import '../widgets/customTextFormField.dart';
import '../widgets/customUploadImgWidget.dart';
// dependency
import 'package:image_picker/image_picker.dart';

// Adapters
import '../adapters/cloudinary.dart';
import '../adapters/firebase.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final _formKey = GlobalKey<FormState>();
  //instances
  CloudinaryService cloudinaryService = CloudinaryService();
  FirebaseService firebaseService = FirebaseService();

  // Controladores
  final marcaController = TextEditingController();
  final modeloController = TextEditingController();
  final anioController = TextEditingController();
  final millasController = TextEditingController();
  final precioController = TextEditingController();
  final descripcionController = TextEditingController();

  //Controladores del select
  bool? incluyeGluaController = false;
  bool? vendidoController = false;

  //Imagenes en memoria y URLs
  List<XFile>? _mediaFileList = []; // URL en memoria para subir
  List<String>? _mediaFileListCloudinary = []; //  URL en la nube

  //bandera
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    incluyeGluaController = false;
    incluyeGluaController = false;
  }

  @override
  void dispose() {
    // limpiar controladores
    marcaController.dispose();
    modeloController.dispose();
    anioController.dispose();
    millasController.dispose();
    precioController.dispose();
    super.dispose();
  }

  Future<void> subirVehiculo() async {
    print("Marca: ${marcaController.text}");
    print("Modelo: ${modeloController.text}");
    print("Año: ${anioController.text}");
    print("Millas: ${millasController.text}");
    print("Precio: ${precioController.text}");
    print("Descripción: ${descripcionController.text}");
    print("Incluye GLUA: $incluyeGluaController");
    print("Vendido: $vendidoController");

    for (var img in _mediaFileList ?? []) {
      print("Imagen: ${img.path}");
    }

    if (_mediaFileList != null && _mediaFileList!.isNotEmpty) {
      setState(() {
        _isUploading = true;
      });

      try {
        _mediaFileListCloudinary = await cloudinaryService
            .uploadImagesAndGetUrl(_mediaFileList!);

        print("URLs desde Cloudinary:");
        for (var url in _mediaFileListCloudinary!) {
          print(url);
        }

        // subir a firebase
        Car CarsToUploadFirebase = Car(
          imgUrl: _mediaFileListCloudinary!,
          brand: marcaController.text.trim(),
          model: modeloController.text.trim(),
          price: double.parse(precioController.text),
          year: int.parse(anioController.text),
          desc: descripcionController.text,
          miles: int.parse(millasController.text),
          towTruck: incluyeGluaController!,
          sold: vendidoController!,
        );

        firebaseService.uploadDataToFirebase(CarsToUploadFirebase, context);

        // Mostrar snackbar de éxito // cambiar a la alert
        if (context.mounted) {
          showDialog(
            context: context,
            builder:
                (context) => Modal(
                  icon: Icons.check,
                  backgroundColor: const Color.fromARGB(180, 117, 132, 227),
                  message:
                      "Coche subido a la web Exitosamente, desea subir otro vehículo ?",
                  iconColor: const Color.fromARGB(180, 117, 132, 227),
                  onConfirm: () {
                    Navigator.pop(context);
                    // Limpiar campos aquí
                    marcaController.clear();
                    modeloController.clear();
                    anioController.clear();
                    millasController.clear();
                    precioController.clear();
                    descripcionController.clear();
                    
                    setState(() {
                      _mediaFileList!.clear(); 
                      _mediaFileListCloudinary !.clear(); 
                    });

                  },
                  onCancel: () {
                    Navigator.pop(context);
                    Navigator.pop(context); // Vuelve a la página anterior
                  },
                ),
          );
        }
      } catch (e) {
        print(" Error al subir imágenes: $e");

        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error al subir imágenes')));
        }
      } finally {
        if (mounted) {
          setState(() {
            _isUploading = false;
          });
        }
      }
    } else {
      print("No hay imágenes seleccionadas.");

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Por favor selecciona imágenes')),
        );
      }
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

                  /// DropDown Menu
                  Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
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
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: CustomBooleanDropdown(
                              initialValue: vendidoController,
                              onChanged: (value) {
                                setState(() {
                                  vendidoController = value!;
                                });
                              },
                              label: 'Estado VendidoS',
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      backgroundColor: WidgetStatePropertyAll<Color>(
                        Colors.green,
                      ),
                      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                   onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      subirVehiculo();
                    }

                    },
                    child: Text(
                      "Subir a la web",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //loading screen 
          if (_isUploading)
            Positioned.fill(
              child: Container(
                color: Colors.black45, 
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CircularProgressIndicator(color: Colors.white),
                      SizedBox(height: 16),
                      Text(
                        'Subiendo imágenes...',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
