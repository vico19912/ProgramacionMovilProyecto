import 'package:flutter/material.dart';
import 'package:programacion_movil_proyecto/widgets/modal.dart';

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
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Text('Hola')),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Modal(
                          icon: Icons.warning_amber_rounded,
                          backgroundColor: const Color.fromRGBO(65, 113, 103, 1),
                          message: "¿Está seguro de realizar esta acción?",
                          iconColor: Color.fromARGB(255,46,125,50) ,
                          onConfirm: () {
                            Navigator.pop(context);
                            // Ejecuta acción
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
                        builder: (context) => Modal(
                          icon: Icons.delete_forever_rounded,
                          backgroundColor: const Color.fromARGB(180, 113, 65, 65),
                          message: "¿Se eliminará el vehículo, está seguro?",
                          iconColor: Color.fromARGB(255, 113, 65, 65) ,
                          onConfirm: () {
                            Navigator.pop(context);
                            // Ejecuta acción
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
                        builder: (context) => Modal(
                          icon: Icons.feedback_rounded,
                          backgroundColor: const Color.fromARGB(180, 117, 132, 227),
                          message: "¿Acción realizada exitosamente?",
                          iconColor: Color.fromARGB(180, 117, 132, 227) ,
                          onConfirm: () {
                            Navigator.pop(context);
                            // Ejecuta acción
                          },
                          onCancel: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                    child: Text('Feddback'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
