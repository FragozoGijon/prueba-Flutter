// To parse this JSON data, do
//
//     final articulo = articuloFromJson(jsonString);

import 'dart:convert';

Articulo articuloFromJson(String str) => Articulo.fromJson(json.decode(str));

String articuloToJson(Articulo data) => json.encode(data.toJson());

class Articulo {
  List<Datum> data;
  int total;

  Articulo({
    required this.data,
    required this.total,
  });

  factory Articulo.fromJson(Map<String, dynamic> json) => Articulo(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
      };
}

class Datum {
  int id;
  int version;
  String clave;
  String nombre;
  Categoria categoria;
  List<Precio> precios;
  bool activo;

  Datum({
    required this.id,
    required this.version,
    required this.clave,
    required this.nombre,
    required this.categoria,
    required this.precios,
    required this.activo,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        version: json["version"],
        clave: json["clave"],
        nombre: json["nombre"],
        categoria: Categoria.fromJson(json["categoria"]),
        precios:
            List<Precio>.from(json["precios"].map((x) => Precio.fromJson(x))),
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "clave": clave,
        "nombre": nombre,
        "categoria": categoria.toJson(),
        "precios": List<dynamic>.from(precios.map((x) => x.toJson())),
        "activo": activo,
      };
}

class Categoria {
  int id;
  int version;
  String clave;
  String nombre;
  int fechaCreado;

  Categoria({
    required this.id,
    required this.version,
    required this.clave,
    required this.nombre,
    required this.fechaCreado,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        version: json["version"],
        clave: json["clave"],
        nombre: json["nombre"],
        fechaCreado: json["fechaCreado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "clave": clave,
        "nombre": nombre,
        "fechaCreado": fechaCreado,
      };
}

class Precio {
  int id;
  int version;
  int precio;

  Precio({
    required this.id,
    required this.version,
    required this.precio,
  });

  factory Precio.fromJson(Map<String, dynamic> json) => Precio(
        id: json["id"],
        version: json["version"],
        precio: json["precio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "precio": precio,
      };
}
