import 'dart:convert';
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

  Future<bool> mailBorrar(int id) async{
  var uri = Uri.parse('$apiURL/correos/$id');
  var respuesta = await http.delete(uri);
  return respuesta.statusCode==200;
}

} 