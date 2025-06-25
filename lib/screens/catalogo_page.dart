import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

    
class CatalogoPage extends StatelessWidget {
  const CatalogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(), // Puedes personalizarlo
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        title: Image.asset('assets/logo.png', height: 40),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Nuestro Catálogo",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                marcaTile(context, "Toyota", "assets/toyota.png", 67),
                // Agrega más marcas aquí
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getData() async {
  final firestore = FirebaseFirestore.instance;

  try {
    final snapshot = await firestore.collection('Cars').get();

    for (var doc in snapshot.docs) {
      print('Nombre: ${doc['nombre']}');
    }
  } catch (e) {
    print('Error al obtener datos: $e');
  }

  Widget marcaTile(
    BuildContext context,
    String nombre,
    String img,
    int cantidad,
  ) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/vehiculos'),
      child: Column(
        children: [
          Expanded(child: Image.asset(img)),
          Text("$nombre ($cantidad)", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
