import 'package:flutter/material.dart';

class ToyotaScreen extends StatelessWidget {
  final List<Map<String, String>> toyotaCars = [
    {
        'titulo': 'TOYOTA',
        'imagen':
            'ttps://res.cloudinary.com/dtpkeixv3/image/upload/v1745640963/20250425_221601/klyqpygombnzwqvqb8eo.jpg'
      },
      {
        'titulo': 'TOYOTA',
        'imagen':
            'https://res.cloudinary.com/dtpkeixv3/image/upload/v1745641959/20250425_223238/ephdi6iw287zyccqwdpg.jpg'
      },
  ];

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
          children: List.generate(toyotaCars.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(''),
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
