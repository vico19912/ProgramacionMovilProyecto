import 'package:flutter/material.dart';
import 'kia.dart';
import 'bmw.dart';
import 'toyota.dart';
import 'ford.dart';
import 'honda.dart';
import 'hyundai.dart';
import 'chevrolet.dart';
import 'fiat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // Mapa para navegar a cada pantalla según la marca
  final Map<String, Widget Function()> marcaPantallas = {
    'KIA': () => KiaScreen(),
    'BMW': () => BmwScreen(),
    'TOYOTA': () => ToyotaScreen(),
    'FORD': () => FordScreen(),
    'HONDA': () => HondaScreen(),
    'HYUNDAI': () => HyundaiScreen(),
    'CHEVROLET': () => ChevroletScreen(),
    'FIAT': () => FiatScreen(),
  };

  final List<Map<String, String>> marcas = [
    {
      'titulo': 'KIA',
      'imagen': 'https://upload.wikimedia.org/wikipedia/commons/8/8f/Kia_logo3.png'
    },
    {
      'titulo': 'HONDA',
      'imagen': 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Honda-logo.svg'
    },
    {
      'titulo': 'BMW',
      'imagen': 'https://upload.wikimedia.org/wikipedia/commons/4/44/BMW.svg'
    },
    {
      'titulo': 'HYUNDAI',
      'imagen': 'https://upload.wikimedia.org/wikipedia/commons/8/85/Hyundai_logo.svg'
    },
    {
      'titulo': 'FORD',
      'imagen': 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Ford_logo_flat.svg'
    },
    {
      'titulo': 'FIAT',
      'imagen': 'https://upload.wikimedia.org/wikipedia/commons/3/32/Fiat_Auto_logo.png'
    },
    {
      'titulo': 'CHEVROLET',
      'imagen': 'https://upload.wikimedia.org/wikipedia/commons/8/88/Chevrolet-logo.png'
    },
    {
      'titulo': 'TOYOTA',
      'imagen': 'https://upload.wikimedia.org/wikipedia/commons/9/9d/Toyota_logo.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6C9286),
        centerTitle: true,
        title: Text(
          'Catálogo',
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
          children: marcas.map((marca) {
            return GestureDetector(
              onTap: () {
                final screenBuilder = marcaPantallas[marca['titulo']];
                if (screenBuilder != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => screenBuilder()),
                  );
                }
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.network(
                    marca['imagen']!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}


