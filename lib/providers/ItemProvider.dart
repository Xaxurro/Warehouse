import 'dart:convert';
import 'package:http/http.dart' as http;

//clase para realizar la conexión al API de monedas

class ItemProvider {
  final apiURL = 'http://127.0.0.1:8000/api/';

  Future<List<dynamic>> getMonedas() async {
    var url = Uri.parse(apiURL);
    //la respuesta puede llegar en culaquier momento
    var respuesta = await http.get(url);

    //para inducir un poco de retardo
    //await Future.delayed(Duration(seconds: 3));

    // status code htpp 200 ok, / http 400 error del usuario /  htpp 500 error del server
    if (respuesta.statusCode == 200) {
      //los datos vienen en formato json por lo que se debe decodificar
      //los datos deben ser pasados a una lista y dinamica y
      //se recibirán en el futuro :  Future<List<dynamic>>
      return json.decode(respuesta.body);
    } else
      return [];
  }

//método donde le paso el código de la moneda y me retorna el valor
//monedas por código

  Future<double> getValorMoneda(String codigoMoneda) async {
    var url = Uri.parse(apiURL + '/' + codigoMoneda);
    var respuesta = await http.get(url);
    var moneda = json.decode(respuesta.body);
    //la lista viene con comas, por lo tanto se usa replaceAll para cmabiar las comas por puntos
    return double.parse(moneda['Valor'].replaceAll(',', '.'));
  }
}
