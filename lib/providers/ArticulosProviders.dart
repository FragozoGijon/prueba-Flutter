import 'package:flutter/material.dart';
import 'package:prueba/Api/ArticuloServices.dart';

import 'package:prueba/Model/ArticuloModel.dart';

class ArticulosProviders extends ChangeNotifier {
  List<Datum> articulo = []; // Cambiado de List<Categoria> a List<Datum>

  var service = ArtioculoServices();

  bool isLoading = true; // Nueva variable para controlar el estado de carga

  Future<List<Datum>> obtenerArticulos() async {
    if (isLoading) {
      try {
        if (articulo.isEmpty) {
          print("vacio");
          this.articulo = await service.obtenerTodos();
        }
      } finally {
        isLoading =
            false; // Asegura que isLoading sea false después de la carga
        notifyListeners();
      }
    }
    return articulo;
  }

  Future<List<Datum>> refreshArticulos() async {
    isLoading =
        true; // Reinicia el estado de carga para la operación de refresco
    this.articulo = await service.obtenerTodos();
    isLoading = false;
    notifyListeners();
    return articulo;
  }

  Future<void> agregarCategoria(Map<String, dynamic> jsonData) async {
    await service.agregarAr(jsonData); // Pasamos el JSON al servicio
    // Aquí podrías agregar lógica adicional si lo deseas.
  }

  Future<void> eliminarElemento(int id) async {
    await service.eliminarCategoria(id);
    articulo.removeWhere((item) => item.id == id);
    notifyListeners(); // Actualiza la lista automáticamente
  }

  Future<void> actualizarCategoria(
      int id, Map<String, dynamic> jsonData) async {
    await service.actualizarArticulo(id, jsonData);

    // Actualiza la categoría en la lista local
    final index = articulo.indexWhere((item) => item.id == id);
    if (index != -1) {
      articulo[index] =
          Datum.fromJson(jsonData); // Reemplaza el elemento actualizado
      notifyListeners(); // Notifica a los listeners sobre el cambio
    }
  }
}
