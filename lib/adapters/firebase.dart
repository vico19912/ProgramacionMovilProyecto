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
}