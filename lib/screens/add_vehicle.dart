import '../widgets/customBooleanDropdown.dart';
import '../widgets/customTextFormField.dart';
import 'package:flutter/material.dart';
import '../widgets/customUploadImgWidget.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final _formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agregar Vehículo",
          style: TextStyle(
            fontFamily: 'Montserrat' ,
            color: Colors.white
          ),
        ), 
        centerTitle: true,
        backgroundColor: Color(0xFF417167)
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

                  CustomUploadImgWidget(),

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
                    onPressed: () {
                      //Logica para subir a la web
                    },
                    child: Text(
                      "Subir a la web",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'Montserrat' ,
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