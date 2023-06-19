import 'package:flutter/material.dart';

class Libros extends StatefulWidget {
  const Libros({super.key});

  @override
  State<Libros> createState() => _LibrosState();
}

class _LibrosState extends State<Libros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Libros",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.tealAccent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }
}
