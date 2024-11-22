import 'package:flutter/material.dart';
import 'package:mail_box_app/provider/mail_provider.dart';

class CorreosAgregar extends StatefulWidget {
  const CorreosAgregar({super.key});

  @override
  State<CorreosAgregar> createState() => _CorreosAgregarState();
}

class _CorreosAgregarState extends State<CorreosAgregar> {
  TextEditingController correoRCtrl = TextEditingController();
  TextEditingController correoMCtrl = TextEditingController();
  TextEditingController informacionCtrl = TextEditingController();
  TextEditingController paraleloCtrl = TextEditingController();
  String? ramoSeleccionada; 
  List<dynamic> ramo = [];

  @override
    void initState() {
    super.initState();
    cargarRamos(); 
  }

  Future<void> cargarRamos() async {
    MailProvider provider = MailProvider();
    ramo = await provider.getRamos();
    setState(() {}); 
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redactar Correo'),
        backgroundColor: Color(0xff3b8d9e),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              controller: correoRCtrl,
              decoration: InputDecoration(
                labelText: 'Correo del receptor',
                hintText: 'Ingresa el correo',
              ),
            ),
            TextField(
              controller: correoMCtrl,
              decoration: InputDecoration(
                labelText: 'Correo tuyo',
                hintText: 'Ingresa su correo',
              ),
            ),
            TextField(
              controller: informacionCtrl,
              decoration: InputDecoration(
                labelText: 'Correo',
                hintText: 'Redacte su correo',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: paraleloCtrl,
              decoration: InputDecoration(
                labelText: 'Paralelo',
                hintText: 'Ingrese el paralelo',
              ),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              hint: Text('Selecciona el ramo'),
              value: ramoSeleccionada,
              onChanged: (String? newValue) {
                setState(() {
                  ramoSeleccionada = newValue;
                });
              },
              items: ramo.map<DropdownMenuItem<String>>((ramo) {
                return DropdownMenuItem<String>(
                  value: ramo['id'].toString(), 
                  child: Text(ramo['nombre_ramo']),
                );
              }).toList(),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff3b8d9e)),
                onPressed: () {
                  MailProvider provider = MailProvider();
                  provider.mailAgregar(
                    correoRCtrl.text,
                    correoMCtrl.text,
                    informacionCtrl.text ,
                    paraleloCtrl.text,
                    ramoSeleccionada ?? '', 
                  );
                  Navigator.pop(context);
                },
                child: Text('Mandar Correo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}