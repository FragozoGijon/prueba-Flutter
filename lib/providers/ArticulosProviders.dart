import 'package:flutter/material.dart';

import '../Api/ArticuloServices.dart';
import '../Model/ArticuloModel.dart';

class ArticulosProviders extends ChangeNotifier {
  List<Articulo> empresas = [];
  var service = ArticuloServices();

  Future<List<Articulo>> obtenerArticulos() async {
    if (empresas.isEmpty) {
      print("vacio");
      this.empresas = await service.obtenerTodos();
      notifyListeners();

      return empresas;
    } else {
      print("no vacio");
      return empresas;
    }
  }

  Future<List<Articulo>> refreshArticulos() async {
    var service = new ArticuloServices();
    this.empresas = await service.obtenerTodos();
    notifyListeners();
    return empresas;
  }
}
