// import 'package:app/widget/customBooleanDropdown.dart';
// import 'package:flutter/material.dart';
// import '../widgets/customTextFormField.dart'

// class AddVehicle extends StatefulWidget {
//   const AddVehicle({Key? key}) : super(key: key);

//   @override
//   State<AddVehicle> createState() => _AddVehicleState();
// }

// class _AddVehicleState extends State<AddVehicle> {
//   final _formKey = GlobalKey<FormState>();

//   // Controladores
//   final marcaController = TextEditingController();
//   final modeloController = TextEditingController();
//   final anioController = TextEditingController();
//   final millasController = TextEditingController();
//   final precioController = TextEditingController();
//   final descripcionController = TextEditingController();

//   bool? incluyeGluaController = false;
//   bool? vendidoController = false;

//   @override
//   void dispose() {
//     marcaController.dispose();
//     modeloController.dispose();
//     anioController.dispose();
//     millasController.dispose();
//     precioController.dispose();
//     descripcionController.dispose();
//     super.dispose();
//   }

//   void submitForm() {
//     if (_formKey.currentState!.validate()) {
//       final newVehicle = {
//         'marca': marcaController.text,
//         'modelo': modeloController.text,
//         'anio': anioController.text,
//         'millas': millasController.text,
//         'precio': 'Lps.${precioController.text}', // Formateo de precio
//         'descripcion': descripcionController.text,
//         'imageUrl': 'https://via.placeholder.com/150', // Aqui lo vamos a reemplazar con imágenes reales
//         'incluyeGrua': incluyeGluaController,
//         'vendido': vendidoController,
//       };
//       Navigator.pop(context, newVehicle); // 👈 Devolvemos el vehículo al catálogo
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Agregar Vehículo",
//           style: TextStyle(
//             fontFamily: 'Montserrat',
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFF417167),
//       ),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset("assets/backgroundImg.png", fit: BoxFit.cover),
//           ),
//           SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   CustomTextFormField(
//                     label: "Marca",
//                     controller: marcaController,
//                     validatorMsg: 'Por favor ingresa la marca',
//                   ),
//                   SizedBox(height: 16),
//                   CustomTextFormField(
//                     label: "Modelo",
//                     controller: modeloController,
//                     validatorMsg: 'Por favor ingresa el modelo',
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: CustomTextFormField(
//                           label: "Año",
//                           controller: anioController,
//                           validatorMsg: 'Ingresa el año',
//                           keyboardType: TextInputType.number,
//                           isNumber: true,
//                         ),
//                       ),
//                       SizedBox(width: 16),
//                       Expanded(
//                         child: CustomTextFormField(
//                           label: "Millas",
//                           controller: millasController,
//                           validatorMsg: 'Ingresa las millas',
//                           keyboardType: TextInputType.number,
//                           isNumber: true,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   CustomTextFormField(
//                     label: "Precio",
//                     controller: precioController,
//                     validatorMsg: 'Ingresa el precio',
//                     keyboardType: TextInputType.number,
//                     isNumber: true,
//                   ),
//                   SizedBox(height: 16),
//                   Container(
//                     color: Colors.transparent,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: CustomBooleanDropdown(
//                             initialValue: incluyeGluaController,
//                             onChanged: (value) {
//                               setState(() {
//                                 incluyeGluaController = value!;
//                               });
//                             },
//                             label: 'Incluye Grúa',
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: CustomBooleanDropdown(
//                             initialValue: vendidoController,
//                             onChanged: (value) {
//                               setState(() {
//                                 vendidoController = value!;
//                               });
//                             },
//                             label: 'Estado Vendido',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   CustomTextFormField(
//                     label: "Descripcion",
//                     controller: descripcionController,
//                     validatorMsg: "Ingrese Descripción",
//                     maxLines: 4,
//                   ),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
//                       shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                       ),
//                     ),
//                     onPressed: submitForm, // 👈 Aquí cambiamos
//                     child: Text(
//                       "Subir a la web",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Montserrat',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
