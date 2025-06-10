import 'package:flutter/material.dart';
import 'package:programacion_movil_proyecto/screens/add_vehicle.dart';
import 'package:programacion_movil_proyecto/screens/catalog.dart';
import 'package:programacion_movil_proyecto/widgets/modal.dart';
import './screens/edit_vehicle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Importaciones Maradiaga',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  
  Home({super.key});
  
  final Map<String, dynamic> vehicle = {
    'marca': 'Honda',
    'modelo': 'Civic',
    'imageUrl': 'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745642799/20250425_224637/zheabyochlduxxy8xyeu.jpg',
    'millas': '20000',
    'anio': '2017',
    'descripcion': 'En buen estado',
    'precio': '12000',
  };  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Botones para ver pantallas
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AddVehicle()),
                  );
                },
                child: Text("Agrega Vehículo"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditVehicle(vehicle: vehicle,)),
                  );
                },
                child: Text("Editar Vehículo"),
              ),
            ),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CatalogScreen()),
                  );
                },
                child: Text("Catalago"),
              ),
            ),


            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => Modal(
                              icon: Icons.warning_amber_rounded,
                              backgroundColor: Color.fromRGBO(65, 113, 103, 1),
                              message: "¿Está seguro de realizar esta acción?",
                              iconColor: Color.fromARGB(255, 46, 125, 50),
                              onConfirm: () {
                                Navigator.pop(context);
                              },
                              onCancel: () {
                                Navigator.pop(context);
                              },
                            ),
                      );
                    },
                    child: Text('Alert'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => Modal(
                              icon: Icons.delete_forever_rounded,
                              backgroundColor: Color.fromARGB(180, 113, 65, 65),
                              message:
                                  "¿Se eliminará el vehículo, está seguro?",
                              iconColor: Color.fromARGB(255, 113, 65, 65),
                              onConfirm: () {
                                Navigator.pop(context);
                              },
                              onCancel: () {
                                Navigator.pop(context);
                              },
                            ),
                      );
                    },
                    child: Text('Delete'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder:
                          (context) => Modal(
                            icon: Icons.feedback_rounded,
                            backgroundColor: Color.fromARGB(
                              180,
                              117,
                              132,
                              227,
                            ),
                            message: "¿Acción realizada exitosamente?",
                            iconColor: Color.fromARGB(180, 117, 132, 227),
                            onConfirm: () {
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              Navigator.pop(context);
                            },
                          ),
                      );
                    },
                    child: Text('Feedback'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
