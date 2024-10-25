import 'package:flutter/material.dart';

class DrawerRedactar extends StatelessWidget {
  const DrawerRedactar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff243945),
      appBar: AppBar(
        title: const Text("Redactar Comunicado"),
        backgroundColor: const Color(0xff3b8d9e),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo para carrera
            TextField(
              decoration: InputDecoration(
                labelText: "Carrera:",
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 15),
            // Campo para paralelo
            TextField(
              decoration: InputDecoration(
                labelText: "Paralelo:",
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 15),
            // Campo de texto para redactar comunicado
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: "Escribe aquí tu comunicado",
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 15),
            // Botón de enviar
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la funcionalidad de enviar el comunicado
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff3b8d9e),
              ),
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
