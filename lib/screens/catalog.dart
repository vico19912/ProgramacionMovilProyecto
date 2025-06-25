import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:programacion_movil_proyecto/screens/CarDetails.dart';
import 'package:programacion_movil_proyecto/screens/add_vehicle.dart';
import 'package:programacion_movil_proyecto/screens/edit_vehicle.dart';
import 'package:programacion_movil_proyecto/widgets/modal.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Map<String, dynamic>> vehicles = [];
  late Future<void> _loadVehicles;

  @override
  void initState() {
    super.initState();
    _loadVehicles = getData();
  }


  Future<void> getData() async {
    final firestore = FirebaseFirestore.instance;

    try {
      final snapshot = await firestore.collection('Cars').get();

      final datos = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; 

        return data;
      }).toList();

      vehicles = datos;
    } catch (e) {
      print('Error al obtener datos: $e');
    }
  }

    void deleteVehicle(int index) {
      showDialog(
        context: context,
        builder: (context) => Modal(
          icon: Icons.delete_forever_rounded,
          backgroundColor: const Color.fromARGB(180, 113, 65, 65),
          message: "¿Se eliminará el vehículo, está seguro?",
          iconColor: const Color.fromARGB(255, 113, 65, 65),
          onConfirm: () async {
            final vehicleId = vehicles[index]['id'];
            print('Intentando eliminar vehículo con id: $vehicleId');

            try {
              await FirebaseFirestore.instance
                  .collection('Cars')
                  .doc(vehicleId)
                  .delete();

              setState(() {
                vehicles.removeAt(index);
              });

              Navigator.pop(context);
            } catch (e) {
              print('Error al eliminar vehículo: $e');
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error al eliminar vehículo')),
              );
            }
          },
          onCancel: () {
            Navigator.pop(context);
          },
          show: true,
        ),
    );
  }


  void viewVehicle(int index) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarDetailScreen(car: vehicles[index]),
      ),
    );
  }

  void editVehicle(int index) async {
    final updatedVehicle = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditVehicle(
          vehicle: vehicles[index],
          docId: vehicles[index]['id'],  // <-- Pasas el id aquí
        ),
      ),
    );

    if (updatedVehicle != null) {
      setState(() {
        vehicles[index] = updatedVehicle;
      });

      showDialog(
        context: context,
        builder: (context) => Modal(
          icon: Icons.feedback_rounded,
          backgroundColor: const Color.fromARGB(180, 117, 132, 227),
          message: "Edición de vehículo realizada exitosamente",
          iconColor: const Color.fromARGB(180, 117, 132, 227),
          onConfirm: () {
            Navigator.pop(context);
          },
          onCancel: () {
            Navigator.pop(context);
          },
          show: false,
        ),
      );
    }
  }

  void addNewVehicle() async {
    final shouldReload = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddVehicle()),
    );

    if (shouldReload == true) { // se manda por prop 
      setState(() {
        _loadVehicles = getData(); // vuelve a cargar desde Firestore cuando se agrega nuevo vehiculo 
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
      body: FutureBuilder(
        future: _loadVehicles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (vehicles.isEmpty) {
            return Center(child: Text('No hay vehículos disponibles.'));
          }

          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              final vehicle = vehicles[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ListTile(
                      leading: (vehicle['imgUrl'] != null && vehicle['imgUrl'].isNotEmpty)
                          ? Image.network(
                              vehicle['imgUrl'][0],
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.image_not_supported, size: 70),
                      title: Text(
                        vehicle['brand'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Millas Recorridas: ${vehicle['miles']}'),
                          Text('Año: ${vehicle['year']}'),
                          Text('Descripción: ${vehicle['desc']}'),
                          Text('Precio: ${vehicle['price']}'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_red_eye, color: Colors.blue),
                          onPressed: () => viewVehicle(index),
                        ),
                        SizedBox(width: 20),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.yellow[700],
                            size: 30,
                          ),
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewVehicle,
        backgroundColor: Color(0xFF417167),
        child: Icon(Icons.add),
      ),
    );
  }
}
