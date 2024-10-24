import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:mail_box_app/screens/drawer_perfil.dart';
import 'package:mail_box_app/screens/drawer_redactar.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Color(0xff3b8d9e),
      ),
      body: Container(
        color: Color(0xff243945),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Inicio",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.tealAccent,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Filtro",
              style: TextStyle(fontSize: 25, color: Colors.tealAccent),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Carrera',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ramo',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Paralelo',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                onPressed: () {
                  // Proceso de filtracion
                },
                backgroundColor: Colors.purple,
                child: Text('Filtrar'),
              ),
            ),
            SizedBox(height: 20),
            // Seccion de correos a poner
            Expanded(
              child: ListView.builder(
                itemCount: 4, 
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    value: true, // Cambiar a false para desmarcar
                    onChanged: (value) {},
                    title: Text(
                      'Correo',
                      style: TextStyle(color: Colors.white),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.purple,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                      image: AssetImage('assets/images/perro_perfil.jpg'),
                      ), border: Border.all(width: 2.0,color: Color(0xff541643))
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("Nombre",style: TextStyle(fontSize: 17),),
                    )
                ],
              )),
              ListTile(
                title: Text('Perfil'),
                leading: Icon(
                  MdiIcons.faceMan,
                  color: Colors.black,
                ),
                onTap: () => _navegar(context,1) ,

              ),
              Divider(),
              ListTile(
                title: Text('Redactar Correo'),
                leading: Icon(
                  MdiIcons.messageDraw,
                  color: Colors.black,
                ),
                onTap: () => _navegar(context,2) ,

              ),
              
              Divider(),
          ],
        ),
      ),
    );
  }

  void _navegar(BuildContext context, int pagina){
    List<Widget> paginas = [
      DrawerPerfil(),
      DrawerRedactar(),
    ];

    final route = MaterialPageRoute(builder: (context){
      return paginas[pagina-1];
    });

    Navigator.pop(context);
    Navigator.push(context,route);
  }
}