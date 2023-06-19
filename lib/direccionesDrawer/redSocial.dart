import 'package:flutter/material.dart';

class RedSocial extends StatefulWidget {
  const RedSocial({super.key});

  @override
  State<RedSocial> createState() => _RedSocialState();
}

class _RedSocialState extends State<RedSocial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Red Social",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.tealAccent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }
}
