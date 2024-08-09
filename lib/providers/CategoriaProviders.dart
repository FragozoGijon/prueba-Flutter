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

  // función asíncrona que no devuelve ningún valor.
  Future<void> eliminarElemento(int id) async {
    // Llama a un servicio asíncrono que elimina una categoría usando su ID.
    await service.eliminarCategoria(id);
    // Elimina el elemento de la lista local `categoria` donde la ID coincide con la proporcionada.
    categoria.removeWhere((item) => item.id == id);
    // Notifica a los listeners que la lista ha cambiado, lo que actualizará automáticamente la interfaz de usuario.
    notifyListeners();
  }
}
