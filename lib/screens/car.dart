import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String marca;
  final String modelo;
  final int anio;
  final String descripcion;
  final int millas;
  final bool gruaIncluida;
  final List<String> imagenesUrl;
  final int precio;
  final bool vendido;

  Car({
    required this.marca,
    required this.modelo,
    required this.anio,
    required this.descripcion,
    required this.millas,
    required this.gruaIncluida,
    required this.imagenesUrl,
    required this.precio,
    required this.vendido,
  });

  factory Car.fromMap(Map<String, dynamic> data) {
    return Car(
      marca: data['brand'] ?? '',
      modelo: data['model'] ?? '',
      anio: data['year'] ?? 0,
      descripcion: data['desc'] ?? '',
      millas: data['miles'] ?? 0,
      gruaIncluida: data['towTruck'] ?? false,
      imagenesUrl: List<String>.from(data['imgUrl'] ?? []),
      precio: data['price'] ?? 0,
      vendido: data['sold'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brand': marca,
      'model': modelo,
      'year': anio,
      'desc': descripcion,
      'miles': millas,
      'towTruck': gruaIncluida,
      'imgUrl': imagenesUrl,
      'price': precio,
      'sold': vendido,
    };
  }

  /// Función estática para obtener la lista de carros desde Firestore
  static Future<List<Car>> fetchCarsFromFirebase() async {
    final snapshot = await FirebaseFirestore.instance.collection('cars').get();
    return snapshot.docs
        .map((doc) => Car.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
