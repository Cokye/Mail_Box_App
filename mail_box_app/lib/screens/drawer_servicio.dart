import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerServicio extends StatelessWidget {
  const DrawerServicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff243945),
      appBar: AppBar(
        title: const Text("Descripción Servicio"),
        backgroundColor: const Color(0xff3b8d9e),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
              child: Text('¿Qué es Mail_Box?',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)

          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20.0, 20, 0),
            child: Text('Es una aplicación de correo que ofrece una experiencia\nrápida y segura para gestionar la comunicación entre\nprofesores y alumnos sin compremeter sus datos\npersonales.', 
            style: TextStyle(color: Colors.white),),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(20, 20.0, 20, 0),
            child: 
            Text('Funcionalidades principales', 
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.fromLTRB(20, 20.0, 20, 0),
            child: Text('\u2022'+' Envío y recepción de correos electrónicos\n'+'\u2022'+' Filtros para que la información llegue a las personas correctas\n', 
            style: TextStyle(color: Colors.white),),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text('Equipo', 
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text('\u2022 Felipe Alvarez\n\u2022 Javiera Barrientos\n\u2022 Agustin Fuentes', 
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white),),
          ),
        ]
      ),
      bottomNavigationBar: BottomAppBar(
    color: Colors.white,
    child: Linkify(
            onOpen: _onOpen,
            text: "Esta aplicación está pensada para ser utilizada por profesores y estudiantes de la Universidad Federico Santa Maria, para más información dirigirse a: https://usm.cl",
          ),
    //Text('Esta aplicación está pensada para ser utilizada por profesores y estudiantes de la Universidad Federico Santa Maria, para más información dirigirse a:'
      
    
  ),
    );
    
  }
  Future<void> _onOpen(LinkableElement link) async {
  final Uri url = Uri.parse(link.url); // Convertir a Uri
  if (await canLaunchUrl(url)) {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication, // Abrir en una aplicación externa
    );
  } else {
    print('No se pudo abrir el enlace: ${link.url}');
    throw 'No se pudo abrir el enlace: ${link.url}';
  }
}
  }
  
 
