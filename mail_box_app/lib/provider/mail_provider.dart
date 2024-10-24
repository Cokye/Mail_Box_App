/* import 'dart:convert';
import 'package:http/http.dart' as http;

class MailProvider{

  final apiURL = 'https://api.gael.cloud/general/public/monedas';

  Future<List<dynamic>> getMail()async{
    var url = Uri.parse(apiURL);
    var respuesta = await http.get(url);

    if(respuesta.statusCode == 200){
      return json.decode(respuesta.body);
    }else{
      return[];
    }
  } 
  #editar
  Future <double> getValorMoneda(String codigoMail) async {
    var url = Uri.parse(apiURL + '/'+codigoMail);
    var respuesta = await http.get(url);
    var mail = json.decode(respuesta.body);
    return double.parse(mail['Valor'].replaceAll(',','.'));


  }
} */