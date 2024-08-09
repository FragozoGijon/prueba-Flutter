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

  Future<void> agregarCategoria(Map<String, dynamic> categoria) async {
    final response = await http.post(
      Uri.parse('https://basic2.visorus.com.mx/categoria'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(categoria), // Convertimos el mapa a JSON string
    );

    // Imprimir el código de estado y el cuerpo de la respuesta
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      print("Categoría agregada exitosamente");
    } else {
      // Lanzar excepción con detalles de la respuesta
      throw Exception('Error al agregar la categoría: ${response.body}');
    }
  }

  Future<void> actualizarCategoria(
      int id, Map<String, dynamic> categoria) async {
    final response = await http.put(
      Uri.parse('https://basic2.visorus.com.mx/categoria/$id'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(categoria),
    );

    if (response.statusCode == 200) {
      print("Categoría actualizada exitosamente");
    } else {
      throw Exception('Error al actualizar la categoría');
    }
  }
}
