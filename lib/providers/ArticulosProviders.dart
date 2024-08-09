import 'package:flutter/material.dart';
import 'package:prueba/Api/ArticuloServices.dart';
import 'package:prueba/Model/ArticuloModel.dart';

class ArticulosProviders extends ChangeNotifier {
  List<Articulo> articulo = [];
  var service = ArtioculoServices();
  bool isLoading = true;
  bool useSampleData =
      false; // Nueva variable para alternar entre datos reales y de muestra

  Future<List<Articulo>> obtenerArticulos() async {
    if (isLoading) {
      try {
        if (useSampleData) {
          // Datos de muestra
          articulo = _obtenerDatosDeMuestra();
        } else {
          if (articulo.isEmpty) {
            print("vacio");
            this.articulo = await service.obtenerTodos();
          }
        }
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }
    return articulo;
  }

  Future<List<Articulo>> refreshArticulos() async {
    isLoading = true;
    if (useSampleData) {
      articulo = _obtenerDatosDeMuestra();
    } else {
      this.articulo = await service.obtenerTodos();
    }
    isLoading = false;
    notifyListeners();
    return articulo;
  }

  Future<void> eliminarElemento(String clave) async {
    if (!useSampleData) {
      await service.eliminarArticulo(clave);
    }
    articulo.removeWhere((item) => item.clave == clave);
    notifyListeners();
  }

  Future<void> agregarElemento(Articulo nuevoArticulo) async {
    if (!useSampleData) {
      await service.agregarArticulo(nuevoArticulo);
    }
    articulo.add(nuevoArticulo);
    notifyListeners(); // Actualiza la lista automáticamente
  }

  void toggleDataMode() {
    useSampleData = !useSampleData;
    notifyListeners();
  }

  List<Articulo> _obtenerDatosDeMuestra() {
    return [
      Articulo(
        clave: "L01",
        categoria: 1,
        nombre: "Lenovo",
        precios: [Precio(precio: 12000), Precio(precio: 12500)],
        activo: true,
      ),
      Articulo(
        clave: "L02",
        categoria: 2,
        nombre: "HP",
        precios: [Precio(precio: 11000), Precio(precio: 11500)],
        activo: false,
      ),
    ];
  }
}
