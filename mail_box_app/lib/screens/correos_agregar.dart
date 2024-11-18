import 'package:flutter/material.dart';

class CorreosAgregar extends StatefulWidget {
  const CorreosAgregar({super.key});

  @override
  State<CorreosAgregar> createState() => _CorreosAgregarState();
}

class _CorreosAgregarState extends State<CorreosAgregar> {
  TextEditingController correoRCtrl = TextEditingController();
  TextEditingController correoMCtrl = TextEditingController();
  TextEditingController asuntoCtrl = TextEditingController();
  TextEditingController informacionCtrl = TextEditingController();
  TextEditingController paraleloCtrl = TextEditingController();
  String? ramoSeleccionada; 
  List<dynamic> ramo = [];

  @override
    void initState() {
    super.initState();
    cargarMarcas(); 
  }

  Future<void> cargarMarcas() async {
    //AutosProvider provider = AutosProvider();
    //marcas = await provider.getMarcas();
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
              controller: asuntoCtrl,
              decoration: InputDecoration(
                labelText: 'Asunto',
                hintText: 'Ingrese el asunto',
              ),
              keyboardType: TextInputType.number,
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
                  child: Text(ramo['nombre']),
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
                  //AutosProvider provider = AutosProvider();
                  //provider.autosAgregar(
                    //modeloCtrl.text,
                    //patenteCtrl.text,
                    //precioCtrl.text,
                    //categoriaSeleccionada ?? '', 
                  //);
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