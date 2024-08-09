import 'dart:convert';

Categoria categoriaFromJson(String str) => Categoria.fromJson(json.decode(str));

String categoriaToJson(Categoria data) => json.encode(data.toJson());

class Categoria {
  List<Datum> data;
  int total;

  Categoria({
    required this.data,
    required this.total,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
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
  int fechaCreado;
  dynamic categoria;
  List<dynamic> categorias;
  bool activo;

  Datum({
    required this.id,
    required this.version,
    required this.clave,
    required this.nombre,
    required this.fechaCreado,
    required this.categoria,
    required this.categorias,
    required this.activo,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        version: json["version"],
        clave: json["clave"],
        nombre: json["nombre"],
        fechaCreado: json["fechaCreado"],
        categoria: json["categoria"],
        categorias: List<dynamic>.from(json["categorias"].map((x) => x)),
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "clave": clave,
        "nombre": nombre,
        "fechaCreado": fechaCreado,
        "categoria": categoria,
        "categorias": List<dynamic>.from(categorias.map((x) => x)),
        "activo": activo,
      };
}
