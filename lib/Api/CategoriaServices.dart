import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Model/CategoriaModel.dart';

class CategoriaServices {
  Future<List<Categoria>> obtenerTodos() async {
    print("hace consulta");
    http.Response response = await http.get(
      Uri.parse('http://192.168.193.241/appr/datos/categoria'),
    );
    if (response.statusCode == 200) {
      final decoded = await json.decode(response.body);
      var lst = <Categoria>[];
      for (var categoria in decoded["data"]) {
        var pl = new Categoria.fromJson(categoria);
        lst.add(pl);
      }
      return lst;
    }
    return [];
  }
}
