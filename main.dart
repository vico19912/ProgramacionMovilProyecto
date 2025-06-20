import 'package:flutter/material.dart';
// import '.screens/catalogo_page.dart';
// import 'screens/lista_vehiculos_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Importaciones Maradiaga',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        // '/': (context) => const CatalogoPage(),           // Pantalla inicial
        // '/vehiculos': (context) => const ListaVehiculosPage(), // Al ver autos de una marca
      },
    );
  }
}
