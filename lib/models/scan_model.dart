// To parse this JSON data, do
//     final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

class ScanModel {
  ScanModel({
    required this.id,
    required this.tipo,
    required this.valor,
  }) {
    if(this.tipo.contains('http')){
      this.tipo = 'http';
    } else {
      this.tipo = 'geo';
    }
  }

  int id;
  String tipo;
  String valor;

  factory ScanModel.fromRawJson(String str) =>
      ScanModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
