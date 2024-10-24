import 'package:flutter/material.dart';

class DrawerRedactar extends StatelessWidget {
  const DrawerRedactar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff243945),
      appBar: AppBar(
        title: Text("Redactar correo"),
        backgroundColor: Color(0xff3b8d9e),
      ),
      body: Center(
        child: Text("Redactar correo"),
      ),
    );
  }
}