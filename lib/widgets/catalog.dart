import 'package:flutter/material.dart';
import 'edit_vehicle.dart';
import 'add_vehicle.dart'; // Importamos tu pantalla de agregar vehículo

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
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
      'imageUrl': 'https://via.placeholder.com/150', // Aqui lo vamos a reemplazar con imágenes reales
    },
    {
      'marca': 'Kia SORENTO',
      'modelo': 'SORENTO',
      'millas': '170,095',
      'anio': '2016',
      'descripcion': 'Enciende y camina',
      'precio': 'Lps.155,000',
      'imageUrl': 'https://via.placeholder.com/150', // Aqui lo vamos a reemplazar con imágenes reales
    },
  ];

  void deleteVehicle(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('¿Está seguro que desea eliminar este registro?'),
        actions: [
          TextButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              'Eliminar',
              style: TextStyle(color: Colors.orange),
            ),
            onPressed: () {
              setState(() {
                vehicles.removeAt(index);
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void viewVehicle(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(vehicles[index]['marca']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Millas Recorridas: ${vehicles[index]['millas']}'),
            Text('Año: ${vehicles[index]['anio']}'),
            Text('Descripción: ${vehicles[index]['descripcion']}'),
            Text('Precio: ${vehicles[index]['precio']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void editVehicle(int index) async {
    final updatedVehicle = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditVehicle(vehicle: vehicles[index]),
      ),
    );

    if (updatedVehicle != null) {
      setState(() {
        vehicles[index] = updatedVehicle;
      });
    }
  }

  void addNewVehicle() async {
    final newVehicle = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddVehicle(),
      ),
    );

    if (newVehicle != null) {
      setState(() {
        vehicles.add(newVehicle);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo'),
        centerTitle: true,
        backgroundColor: Color(0xFF417167),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ListTile(
                  leading: Image.network(
                    vehicle['imageUrl'],
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                  title: Text(vehicle['marca'], style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Millas Recorridas: ${vehicle['millas']}'),
                      Text('Año: ${vehicle['anio']}'),
                      Text('Descripción: ${vehicle['descripcion']}'),
                      Text('Precio: ${vehicle['precio']}'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_red_eye, color: Colors.blue, size: 30),
                      onPressed: () => viewVehicle(index),
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.yellow[700], size: 30),
                      onPressed: () => editVehicle(index),
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red, size: 30),
                      onPressed: () => deleteVehicle(index),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewVehicle, // Abre el formulario para agregar un vehículo
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF417167),
      ),
    );
  }
}
