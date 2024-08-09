import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba/Model/ArticuloModel.dart';

class ArtioculoServices {
  Future<List<Articulo>> obtenerTodos() async {
    print("hace consulta");
    http.Response response = await http.get(
      Uri.parse('https://basic2.visorus.com.mx/articulo'),
    );
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);

      List<Articulo> lst = [];
      for (var item in decoded["data"]) {
        Articulo articulo = Articulo.fromJson(item);
        lst.add(articulo);
      }
      print(lst.length);
      return lst;
    }
    return [];
  }

  Future<void> eliminarArticulo(String clave) async {
    http.Response response = await http.delete(
      Uri.parse('https://basic2.visorus.com.mx/articulo/$clave'),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al eliminar el articulo');
    }
    print("eliminado");
  }

  Future<void> agregarArticulo(Articulo articulo) async {
    http.Response response = await http.post(
      Uri.parse('https://basic2.visorus.com.mx/articulo'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(articulo.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Error al agregar el articulo');
    }
    print("agregado");
  }
}
