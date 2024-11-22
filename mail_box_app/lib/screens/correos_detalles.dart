import 'package:flutter/material.dart';
import 'package:mail_box_app/provider/mail_provider.dart';

class CorreosDetalles extends StatefulWidget {
  final int id;
  final String correo;
  final String paralelo;
  final String ramo;
  final String info;

  const CorreosDetalles({
    super.key,
    required this.id,
    required this.correo,
    required this.paralelo,
    required this.ramo,
    required this.info,
  });

  @override
  State<CorreosDetalles> createState() => _CorreosDetallesState();
}

class _CorreosDetallesState extends State<CorreosDetalles> {
  final MailProvider _mailProvider = MailProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Mail'),
        backgroundColor: Color(0xff3b8d9e),
      ),
      backgroundColor: Color(0xff243945),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Remitente: ${widget.correo}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.mail, size: 40, color: Color(0xff3b8d9e)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Paralelo: ${widget.paralelo}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                Text(
                  'Ramo: ${widget.ramo}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${widget.info}',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Spacer(),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffD60019),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextButton(
                onPressed: () {
                  confirmDelete(context);
                },
                child: Text(
                  'Borrar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> confirmDelete(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar borrado'),
          content: Text('¿Borrar el mail ${widget.correo}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('CANCELAR'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                await borrarMails();
              },
              child: Text('ACEPTAR'),
            ),
          ],
        );
      },
    );
  }

  Future<void> borrarMails() async {
    bool borradoExitoso = await _mailProvider.mailBorrar(widget.id);
    if (borradoExitoso) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mail borrado exitosamente')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al borrar el Mail')),
      );
    }
  }
}
