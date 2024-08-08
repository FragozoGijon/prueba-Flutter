import 'package:flutter/material.dart';

import '../Api/CategoriaServices.dart';
import '../Model/CategoriaModel.dart';

class CategoriaProviders extends ChangeNotifier {
  List<Categoria> categoria = [];
  var service = CategoriaServices();

  Future<List<Categoria>> obtenerArticulos() async {
    if (categoria.isEmpty) {
      print("vacio");
      this.categoria = await service.obtenerTodos();
      notifyListeners();

      return categoria;
    } else {
      print("no vacio");
      return categoria;
    }
  }

  Future<List<Categoria>> refreshArticulos() async {
    var service = new CategoriaServices();
    this.categoria = await service.obtenerTodos();
    notifyListeners();
    return categoria;
  }
}
