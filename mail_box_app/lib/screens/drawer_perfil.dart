import 'package:flutter/material.dart';

class DrawerPerfil extends StatelessWidget {
  const DrawerPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff243945),
      appBar: AppBar(
        title: Text("Perfil"),
        backgroundColor: Color(0xff3b8d9e),
      ),
      body: Center(
        child: Text("Perfil"),
      ),
    );
  }
}