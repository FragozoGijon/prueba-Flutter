import 'dart:convert';

Articulo articuloFromJson(String str) => Articulo.fromJson(json.decode(str));

String articuloToJson(Articulo data) => json.encode(data.toJson());

class Articulo {
  String clave;
  int categoria;
  String nombre;
  List<Precio> precios;
  bool activo;

  Articulo({
    required this.clave,
    required this.categoria,
    required this.nombre,
    required this.precios,
    required this.activo,
  });

  factory Articulo.fromJson(Map<String, dynamic> json) => Articulo(
        clave: json["clave"],
        categoria: json["categoria"],
        nombre: json["nombre"],
        precios:
            List<Precio>.from(json["precios"].map((x) => Precio.fromJson(x))),
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "clave": clave,
        "categoria": categoria,
        "nombre": nombre,
        "precios": List<dynamic>.from(precios.map((x) => x.toJson())),
        "activo": activo,
      };
}

class Precio {
  int precio;

  Precio({
    required this.precio,
  });

  factory Precio.fromJson(Map<String, dynamic> json) => Precio(
        precio: json["precio"],
      );

  Map<String, dynamic> toJson() => {
        "precio": precio,
      };
}
