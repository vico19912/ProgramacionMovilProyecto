import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/Cars.dart';

class FirebaseService {
  final _db = FirebaseFirestore.instance;

  FirebaseService();

  Future<void> uploadDataToFirebase(Car obj, BuildContext context) async {
    final carToUpload = <String, dynamic>{
      "brand": obj.brand,
      "towTruck": obj.towTruck,
      "desc": obj.desc,
      "imgUrl": obj.imgUrl,
      "miles": obj.miles,
      "model": obj.model,
      "price": obj.price,
      "sold": obj.sold,
      "year": obj.year,
    };

    try {
      await _db.collection("Cars").add(carToUpload);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Coche subido exitosamente!'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al subir coche: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  // Future<void> updateDataToFirebase(Car newObj, BuildContext context) async {
  //   try {
  //     await _db.collection("Cars").doc(newObj.id).update({
  //       "brand": newObj.brand,
  //       "towTruck": newObj.towTruck,
  //       "desc": newObj.desc,
  //       "imgUrl": newObj.imgUrl,
  //       "miles": newObj.miles,
  //       "model": newObj.model,
  //       "price": newObj.price,
  //       "sold": newObj.sold,S
  //       "year": newObj.year,
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('¡Coche actualizado exitosamente!'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error al actualizar el coche: $e'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //   }
  // }

  // Future<void> deleteDataToFirebase(
  //     String idDocument, BuildContext context) async {
  //   try {
  //     await _db.collection("Cars").doc(idDocument).delete();
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("vehiculo Eliminado")));
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Error al eliminar: $e")), 
  //     );
  //   }
  // }
}