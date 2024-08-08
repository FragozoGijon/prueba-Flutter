import 'dart:convert';

Categoria categoriaFromJson(String str) => Categoria.fromJson(json.decode(str));

String categoriaToJson(Categoria data) => json.encode(data.toJson());

class Categoria {
  String clave;
  DateTime fechaCreado;
  String nombre;

  Categoria({
    required this.clave,
    required this.fechaCreado,
    required this.nombre,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        clave: json["clave"] as String,
        fechaCreado: json["fechaCreado"] as DateTime,
        nombre: json["nombre"] as String,
      );

  Map<String, dynamic> toJson() => {
        "clave": clave,
        "fechaCreado": fechaCreado,
        "nombre": nombre,
      };
}
