import 'package:flutter/material.dart';

class FiatScreen extends StatelessWidget {
  final List<Map<String, String>> fiatCars = [
     {
        'titulo': 'FIAT',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745640792/20250425_221311/wgirxkif44smutekduic.jpg'
      },
  ];

<<<<<<< HEAD
  const FiatScreen({super.key});

=======
>>>>>>> e3846cc6db5ab1270407338ec69e0b87c4114f63
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6C9286),
        centerTitle: true,
        title: Text(
          'TOYOTA',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: List.generate(fiatCars.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(fiatCars[index]['imagen']!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Text(
                  toyotaCars[index]['titulo']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
