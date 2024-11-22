import 'dart:convert';
import 'dart:collection';
import 'package:http/http.dart' as http;

class MailProvider{

  final apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getMail() async {
    var uri = Uri.parse('$apiURL/correo');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

    Future<List<dynamic>> getRamos() async {
    var uri = Uri.parse('$apiURL/ramos');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

    Future<LinkedHashMap<String, dynamic>> mailAgregar(
        String correo_remitente, String correo_recepcion, String paralelo, String ramo, String info) async {
      var uri = Uri.parse('$apiURL/correo'); 
      var respuesta = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'correo_remitente': correo_remitente,
          'correo_repector': correo_recepcion,
          'paralelo': paralelo,
          'ramo': ramo,
          'informacion': info,
        }),
      );

      if (respuesta.statusCode == 200) {
        return json.decode(respuesta.body);
      } else {
        throw Exception('Error al agregar el auto: ${respuesta.body}');
      }
    }






  Future<bool> mailBorrar(int id) async{
  var uri = Uri.parse('$apiURL/correo/$id');
  var respuesta = await http.delete(uri);
  return respuesta.statusCode==200;
}

  Future<bool> ramosBorrar(int id) async{
  var uri = Uri.parse('$apiURL/ramos/$id');
  var respuesta = await http.delete(uri);
  return respuesta.statusCode==200;
}

} 