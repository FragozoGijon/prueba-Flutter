import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Model/CategoriaModel.dart';

class CategoriaServices {
  Future<List<Datum>> obtenerTodos() async {
    print("hace consulta");
    http.Response response = await http.get(
      Uri.parse('https://basic2.visorus.com.mx/categoria'),
    );
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);

      List<Datum> lst = [];
      for (var item in decoded["data"]) {
        Datum datum = Datum.fromJson(item);
        lst.add(datum);
      }
      print(lst.length);
      return lst;
    }
    return [];
  }

  Future<void> eliminarCategoria(int id) async {
    http.Response response = await http.delete(
      Uri.parse('https://basic2.visorus.com.mx/categoria/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al eliminar la categoría');
    }
    print("elimado");
  }

  Future<Datum> agregarCategoria(Datum categoria) async {
    http.Response response = await http.post(
      Uri.parse('https://basic2.visorus.com.mx/categoria'),
      headers: {"Content-Type": "application/json"},
      body: categoria,
    );
    if (response.statusCode == 201) {
      final decoded = json.decode(response.body);
      return Datum.fromJson(decoded);
    } else {
      throw Exception('Error al agregar la categoría');
    }
  }
}
