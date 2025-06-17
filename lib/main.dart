import 'package:flutter/material.dart';
import 'package:programacion_movil_proyecto/screens/add_vehicle.dart';
import 'package:programacion_movil_proyecto/screens/catalog.dart';
import 'package:programacion_movil_proyecto/widgets/modal.dart';
import './screens/edit_vehicle.dart';
import './screens/login_screen.dart';

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
      theme: ThemeData(
        primaryColor: const Color(0xFF417167),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF417167),
          primary: const Color(0xFF417167),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF417167),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF417167),
            foregroundColor: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      home: const InitialNavigationScreen(), 
    );
  }
}

class InitialNavigationScreen extends StatelessWidget {
  const InitialNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text('Ir a Login'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.directions_car),
                label: const Text('Ver Catálogo Directo'),
                 style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.blueGrey, 
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CatalogScreen()),
                  );
                },
              ),
               const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.home_work_outlined), 
                label: const Text('Ir a Home (Desarrollo)'),
                 style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.orangeAccent, 
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()), 
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Home extends StatelessWidget {
  Home({super.key});

  final Map<String, dynamic> vehicle = {
    'marca': 'Honda',
    'modelo': 'Civic',
    'imageUrl':
        'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745642799/20250425_224637/zheabyochlduxxy8xyeu.jpg',
    'millas': '20000',
    'anio': '2017',
    'descripcion': 'En buen estado',
    'precio': '12000',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text("Home Desarrollo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( 
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
                  child: const Text("Agrega Vehículo"),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => EditVehicle(
                                vehicle: vehicle,
                              )),
                    );
                  },
                  child: const Text("Editar Vehículo (Ejemplo)"),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const CatalogScreen()),
                    );
                  },
                  child: const Text("Catalago"),
                ),
              ),
              const SizedBox(height: 20),
              Row(
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
                            iconColor: const Color.fromARGB(255, 46, 125, 50),
                            onConfirm: () {
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                      child: const Text('Alert'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => Modal(
                            icon: Icons.delete_forever_rounded,
                            backgroundColor: const Color.fromARGB(180, 113, 65, 65),
                            message:
                                "¿Se eliminará el vehículo, está seguro?",
                            iconColor: const Color.fromARGB(255, 113, 65, 65),
                            onConfirm: () {
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                      child: const Text('Delete'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => Modal(
                            icon: Icons.feedback_rounded,
                            backgroundColor: const Color.fromARGB(
                              180,
                              117,
                              132,
                              227,
                            ),
                            message: "¿Acción realizada exitosamente?",
                            iconColor: const Color.fromARGB(180, 117, 132, 227),
                            onConfirm: () {
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                      child: const Text('Feedback'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}