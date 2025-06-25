<<<<<<< HEAD
import 'package:flutter/material.dart';

class ListaVehiculosPage extends StatelessWidget {
  const ListaVehiculosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Chip(
              label: Text("TOYOTA", style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                vehiculoTile(
                  "https://importacionesmaradiaga.com/imagenes/vehiculos/tacoma2014.jpg",
                  "Toyota Tacoma 2014",
                  "L.354,000",
                ),
                // Más vehículos aquí
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget vehiculoTile(String url, String nombre, String precio) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              height: 160,
              width: double.infinity,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            color: Colors.black.withOpacity(0.4),
            child: Text(
              "$precio\n$nombre",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';

class ListaVehiculosPage extends StatelessWidget {
  const ListaVehiculosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Chip(
              label: Text("TOYOTA", style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                vehiculoTile(
                  "https://importacionesmaradiaga.com/imagenes/vehiculos/tacoma2014.jpg",
                  "Toyota Tacoma 2014",
                  "L.354,000",
                ),
                // Más vehículos aquí
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget vehiculoTile(String url, String nombre, String precio) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              height: 160,
              width: double.infinity,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            color: Colors.black.withOpacity(0.4),
            child: Text(
              "$precio\n$nombre",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
>>>>>>> e3846cc6db5ab1270407338ec69e0b87c4114f63
