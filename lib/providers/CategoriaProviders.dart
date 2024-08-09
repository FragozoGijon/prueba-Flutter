import 'package:flutter/material.dart';

import '../Api/CategoriaServices.dart';
import '../Model/CategoriaModel.dart';

class CategoriaProviders extends ChangeNotifier {
  List<Datum> categoria = []; // Cambiado de List<Categoria> a List<Datum>
  var service = CategoriaServices();

  bool isLoading = true; // Nueva variable para controlar el estado de carga

  Future<List<Datum>> obtenerArticulos() async {
    if (isLoading) {
      try {
        if (categoria.isEmpty) {
          print("vacio");
          this.categoria = await service.obtenerTodos();
        }
      } finally {
        isLoading =
            false; // Asegura que isLoading sea false después de la carga
        notifyListeners();
      }
    }
    return categoria;
  }

  Future<List<Datum>> refreshArticulos() async {
    isLoading =
        true; // Reinicia el estado de carga para la operación de refresco
    this.categoria = await service.obtenerTodos();
    isLoading = false;
    notifyListeners();
    return categoria;
  }

  Future<void> agregarCategoria(Map<String, dynamic> jsonData) async {
    await service.agregarCategoria(jsonData); // Pasamos el JSON al servicio
    // Aquí podrías agregar lógica adicional si lo deseas.
  }

  Future<void> eliminarElemento(int id) async {
    await service.eliminarCategoria(id);
    categoria.removeWhere((item) => item.id == id);
    notifyListeners(); // Actualiza la lista automáticamente
  }

  Future<void> actualizarCategoria(
      int id, Map<String, dynamic> jsonData) async {
    await service.actualizarCategoria(id, jsonData);

    // Actualiza la categoría en la lista local
    final index = categoria.indexWhere((item) => item.id == id);
    if (index != -1) {
      categoria[index] =
          Datum.fromJson(jsonData); // Reemplaza el elemento actualizado
      notifyListeners(); // Notifica a los listeners sobre el cambio
    }
  }
}
