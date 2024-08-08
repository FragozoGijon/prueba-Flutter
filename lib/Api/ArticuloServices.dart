import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Model/ArticuloModel.dart';

class ArticuloServices {
  Future<List<Articulo>> obtenerTodos() async {
    print("hace consulta");
    http.Response response = await http.get(
      Uri.parse('http://192.168.193.241/appr/datos/articulo'),
    );

    if (response.statusCode == 200) {
      final decoded = await json.decode(response.body);
      var lst = <Articulo>[];
      for (var platillo in decoded["data"]) {
        var pl = new Articulo.fromJson(platillo);
        lst.add(pl);
      }
      return lst;
    }
    return [];
  }
}
