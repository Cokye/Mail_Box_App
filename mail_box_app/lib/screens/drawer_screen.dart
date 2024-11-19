import 'package:flutter/material.dart';
import 'package:mail_box_app/screens/drawer_servicio.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mail_box_app/provider/mail_provider.dart';
import 'package:mail_box_app/screens/correos_agregar.dart';
import 'package:mail_box_app/screens/correos_detalles.dart';
import 'package:mail_box_app/screens/drawer_perfil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  MailProvider provider = MailProvider();

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
            Expanded(
            child: FutureBuilder(
              future: provider.getMail(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                        IconButton(
                                          icon: Icon(Icons.mail, color: Colors.orange),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CorreosDetalles(
                                                  //modelo: snapshot.data[index]['modelo'],
                                                  //patentes: snapshot.data[index]['patentes'],
                                                  //marca: snapshot.data[index]['marca']['nombre'],
                                                  //precio: snapshot.data[index]['precio'].toDouble(),
                                                  //marca_id: snapshot.data[index]['marca_id'],

                                                ),
                                              ),
                                            );
                                          },
                                        ),

                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(padding: EdgeInsets.only(left: 80),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${snapshot.data[index]['correo_remitente']}'),
                                Text('${snapshot.data[index]['paralelo']}'),
                              ],
                            ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(padding: EdgeInsets.only(right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('\$${snapshot.data[index]['paralelo'].toString()}'),
                              ],
                            ),
                            )
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(200, 59, 142, 158), 
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
                          image: AssetImage('assets/images/Usuario_perfil.png'),
                        ),
                        border: Border.all(width: 2.0, color: Color(0xff541643)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Nombre",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                      leading: Icon(Icons.mail, color: Colors.white),
                      title: Text('Descripción Servicio', style: TextStyle(color: Colors.white)),
                      onTap: () => _navegar(context, 3),
                    ),
              Divider(color: Colors.white),
              ListTile(
                title: Text(
                  'Perfil',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  MdiIcons.faceMan,
                  color: Colors.white,
                ),
                onTap: () => _navegar(context, 1),
              ),
              Divider(color: Colors.white),
              ListTile(
                title: Text(
                  'Redactar Correo',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  MdiIcons.messageDraw,
                  color: Colors.white,
                ),
                onTap: () => _navegar(context, 2),
              ),
              Divider(color: Colors.white),
              
              ListTile(
                      leading: Icon(Icons.logout, color: Colors.white),
                      title: Text('Cerrar Sesión', style: TextStyle(color: Colors.white)),
                      onTap: () {},
                    ),
              Divider(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  void _navegar(BuildContext context, int pagina) {
    List<Widget> paginas = [
      DrawerPerfil(),
      CorreosAgregar(),
      DrawerServicio(),
    ];

    final route = MaterialPageRoute(builder: (context) {
      return paginas[pagina - 1];
    });

    Navigator.pop(context);
    Navigator.push(context, route);
  
  }
}