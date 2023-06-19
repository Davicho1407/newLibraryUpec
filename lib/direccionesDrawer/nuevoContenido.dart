import 'package:flutter/material.dart';

class NuevoContenido extends StatefulWidget {
  const NuevoContenido({super.key});

  @override
  State<NuevoContenido> createState() => _NuevoContenidoState();
}

class _NuevoContenidoState extends State<NuevoContenido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nuevo Contenido",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.tealAccent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }
}
