import 'package:flutter/material.dart';


class CarDetailScreen extends StatelessWidget {
  final Map<String, dynamic> car;
  const CarDetailScreen({super.key,required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xFF041716),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${car['brand']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    car['imgUrl'][0],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.broken_image, size: 100),
                  ),
                  Positioned(
                    left: 16,
                    child: Icon(Icons.arrow_back_ios, color: Color(0xFF041716)),
                  ),
                  Positioned(
                    right: 16,
                    child: Icon(Icons.arrow_forward_ios, color: Color(0xFF041716)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Precio:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(car['price'].toString(),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF041716))),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoItem('Marca:', car['brand']),
                    SizedBox(height: 10,),
                    infoItem('Modelo:', car['model']),
                    SizedBox(height: 10,),
                    infoItem('Año:', car['year'].toString()),
                    SizedBox(height: 10,),
                    infoItem('Descripción:', car['desc']),
                    SizedBox(height: 10,),
                    infoItem('Millas:', car['miles'].toString()),
                    SizedBox(height: 10,),
                    infoItem('Grúa incluida:', (car['towTruck'] as bool? ?? false) ? 'Si' : 'No'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Divider(thickness: 1),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(Icons.radio_button_checked, size: 18, color: Colors.black87),
          const SizedBox(width: 8),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black87),
              children: [
                TextSpan(text: '$title ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: value),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
