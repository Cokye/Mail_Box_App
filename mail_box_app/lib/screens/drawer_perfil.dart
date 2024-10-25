import 'package:flutter/material.dart';

class DrawerPerfil extends StatelessWidget {
  const DrawerPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff243945),
      appBar: AppBar(
        title: const Text("Perfil"),
        backgroundColor: const Color(0xff3b8d9e),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botón de subir foto
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xff3b8d9e),
                child: IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: () {
                    // Aquí puedes agregar la funcionalidad de subir una foto
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Campo para nombre
            TextField(
              decoration: InputDecoration(
                labelText: "Nombre:",
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 15),
            // Campo para apellidos
            TextField(
              decoration: InputDecoration(
                labelText: "Apellidos:",
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 15),
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
            // Campo para materias activas
            TextField(
              decoration: InputDecoration(
                labelText: "Materias Activas:",
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30), // Espacio antes del botón
            // Botón de guardar cambios
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aquí puedes agregar la funcionalidad para guardar los cambios
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cambios guardados')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3b8d9e), // Color de fondo
                  padding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 50),
                ),
                child: const Text('Guardar Cambios'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
