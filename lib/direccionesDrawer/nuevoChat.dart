import 'package:flutter/material.dart';

class NuevoChat extends StatelessWidget {
  const NuevoChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nuevo Chat",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.tealAccent,
      ),
    );
  }
}
