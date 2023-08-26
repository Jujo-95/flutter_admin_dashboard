import 'dart:convert';

class Categoria {
  String id;
  String nombre;
  _Usuario usuario;

  Categoria({
    required this.id,
    required this.nombre,
    required this.usuario,
  });

  factory Categoria.fromRawJson(String str) =>
      Categoria.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: _Usuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario.toJson(),
      };

  @override
  String toString() {
    return 'Categories ${nombre.toString()}';
  }
}

class _Usuario {
  Id id;
  Nombre nombre;

  _Usuario({
    required this.id,
    required this.nombre,
  });

  factory _Usuario.fromRawJson(String str) =>
      _Usuario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory _Usuario.fromJson(Map<String, dynamic> json) => _Usuario(
        id: idValues.map[json["_id"]]!,
        nombre: nombreValues.map[json["nombre"]]!,
      );

  Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "nombre": nombreValues.reverse[nombre],
      };
}

enum Id { THE_64_E7_D3_EAF3_A8994_F605_D41_CD }

final idValues = EnumValues(
    {"64e7d3eaf3a8994f605d41cd": Id.THE_64_E7_D3_EAF3_A8994_F605_D41_CD});

enum Nombre { TEST_17 }

final nombreValues = EnumValues({"Test 17": Nombre.TEST_17});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
