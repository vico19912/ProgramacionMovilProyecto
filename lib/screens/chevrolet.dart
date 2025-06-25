import 'package:flutter/material.dart';

class ChevroletScreen extends StatelessWidget {
  final List<Map<String, String>> chevoaCars = [
     {
        'titulo': 'CHEVROLET',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745641773/20250425_222932/nhgb93ztth3sag2ionig.jpg'
      },
      {
        'titulo': 'CHEVROLET',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745637494/20250425_211813/xkfav5ttfur3cwhs9dgj.jpg'
      },
  ];

  const ChevroletScreen({super.key});

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
          children: List.generate(chevoaCars.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(chevoaCars[index]['imagen']!),
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
