import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'edit_vehicle.dart';
import "add_vehicle.dart";

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Map<String, dynamic>> vehicles = [
    {
      'marca': 'HONDA CRV',
      'modelo': 'CRV',
      'millas': '121,234',
      'anio': '2015',
      'descripcion': 'Estacionario no trae llave',
      'precio': 'Lps.220,000',
      'imageUrl':
          'https://res.cloudinary.com/dtpkeixv3/image/upload/v1747195917/20250513_221156/f3dlx4uiik6cht6l4c4v.jpg',
    },
    {
      'marca': 'Kia SORENTO',
      'modelo': 'SORENTO',
      'millas': '170,095',
      'anio': '2016',
      'descripcion': 'Enciende y camina',
      'precio': 'Lps.155,000',
      'imageUrl':
          'https://res.cloudinary.com/dtpkeixv3/image/upload/v1746157361/20250501_214240/avhpk7bhngwchtr4lzuu.jpg',
    },
  ];

  void deleteVehicle(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Eliminación'),
        content: const Text('¿Estás seguro de que quieres eliminar este vehículo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                vehicles.removeAt(index);
              });
              Navigator.of(context).pop();
            },
            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void editVehicle(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditVehicle(vehicle: vehicles[index]),
      ),
    );
  }

  void viewVehicle(int index) {
    final vehicle = vehicles[index];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(vehicle['marca']),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Image.network(
                vehicle['imageUrl'],
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 100),
              ),
              const SizedBox(height: 10),
              Text('Modelo: ${vehicle['modelo']}'),
              Text('Año: ${vehicle['anio']}'),
              Text('Millas: ${vehicle['millas']}'),
              Text('Precio: ${vehicle['precio']}'),
              const SizedBox(height: 8),
              Text('Descripción: ${vehicle['descripcion']}'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cerrar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Vehículos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar Sesión',
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      vehicle['imageUrl'],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 180,
                          color: Colors.grey[200],
                          child: const Icon(Icons.directions_car, size: 60, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    vehicle['marca'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    vehicle['precio'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Año: ${vehicle['anio']} | Millas: ${vehicle['millas']}'),
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.visibility_outlined),
                        label: const Text('Ver'),
                        onPressed: () => viewVehicle(index),
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.edit_outlined),
                        label: const Text('Editar'),
                        onPressed: () => editVehicle(index),
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.delete_outline, color: Colors.red.shade700),
                        label: Text('Eliminar', style: TextStyle(color: Colors.red.shade700)),
                        onPressed: () => deleteVehicle(index),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddVehicle()),
          );
        },
        tooltip: 'Añadir Vehículo',
        child: const Icon(Icons.add),
      ),
    );
  }
}