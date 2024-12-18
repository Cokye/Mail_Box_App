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

void onIconPressed(){}
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

            const SizedBox(height: 10),
            const Padding(padding: EdgeInsets.only(left: 2),
            child: Text(
              "  Detalles",
              style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold, color: Colors.tealAccent))
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.mail, color: Color(0xff3b8d9e)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CorreosDetalles(
                                        id: snapshot.data[index]['id'],
                                        correo: snapshot.data[index]['correo_remitente'],
                                        paralelo: snapshot.data[index]['paralelo'],
                                        ramo: snapshot.data[index]['ramo']['nombre_ramo'],
                                        info: snapshot.data[index]['informacion'],
                                          ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${snapshot.data[index]['correo_remitente']}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Paralelo: ${snapshot.data[index]['paralelo']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      'Ramo: ${snapshot.data[index]['ramo']['nombre_ramo']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
      drawer: Row(
        children: [
          Drawer(
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
                  
                ],
              ),
            ),
          
          ),
          Align(
            alignment: Alignment(0, -0.9),
            child: Container(
              decoration: BoxDecoration(
                      color: Color.fromARGB(199, 90, 168, 183),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
              width: 35,
              height: 50,
              child: IconButton(
                
                alignment: Alignment.centerLeft,
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: Icon(Icons.close, color: Colors.white,)) ,
                

              ),
            ),
          ]
          )
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