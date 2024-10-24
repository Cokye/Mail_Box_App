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
        child: Column(
          children: [
            /* Container(
              alignment: Alignment.center,
              height: 50,
              child: Icon(Icons.pets,size: 60,),
            ), */
            Flexible(
              child: Container(
                padding: EdgeInsets.only(left:10),
                height: 300,
                margin: EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      height: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      /* child: Text(
                        '',
                        style: TextStyle(color: Colors.black87,fontSize: 18),
                      ), */
                    )
                  ],
                ),
              )),
              
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