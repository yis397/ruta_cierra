import 'dart:convert';

import 'package:flutter_ruta/src/models/actividad_model.dart';
import 'package:flutter_ruta/src/models/imagen.model.dart';

Pueblos pueblosFromJson(String str) => Pueblos.fromJson(json.decode(str));

String pueblosToJson(Pueblos data) => json.encode(data.toJson());

class Pueblos {
  Pueblos({
    required this.data,
    required this.msg,
  });

  List<Pueblo> data;
  String msg;

  factory Pueblos.fromJson(Map<String, dynamic> json) => Pueblos(
        data: List<Pueblo>.from(json["data"].map((x) => Pueblo.fromJson(x))),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "msg": msg,
      };
}

class Pueblo {
  Pueblo({
    this.id = 0,
    this.nombre = '',
    this.completo = '',
    this.descripcion = '',
    this.infiesta = '',
    this.finfiesta = '',
    this.latitud = '',
    this.longitud = '',
    this.clima = '',
    this.img = '',
    this.historia = '',
    this.ubicacionText = '',
  });

  int id;
  String nombre;
  String completo;
  String descripcion;
  String infiesta;
  String finfiesta;
  String latitud;
  String longitud;
  String clima;
  String img;
  String historia;
  String ubicacionText;
  List<Foto> fotos = [];
  List<Actividad> actividades = [];

  factory Pueblo.fromJson(Map<String, dynamic> json) => Pueblo(
        id: json["id"],
        nombre: json["nombre"],
        completo: json["completo"],
        descripcion: json["descripcion"],
        img: json["img"],
      );
  void fromJson2(String str) {
    final jsons = json.decode(str);
    final fiesta = jsons["pueblo"]["fiesta"].toString().split('-');
    infiesta = fiesta[0];
    finfiesta = fiesta[1];
    latitud = jsons["pueblo"]["latitud"];
    longitud = jsons["pueblo"]["longitud"];
    clima = jsons["pueblo"]["clima"];
    historia = jsons["pueblo"]["historia"];
    ubicacionText = jsons["pueblo"]["ubicacionText"];
    List fots = jsons["imgs"];
    List acts = jsons["act"];
    if (!fots.isEmpty) {
      for (var i = 0; i < fots.length; i++) {
        final a = Foto(fots[i]);
        fotos.add(a);
      }
    }
    if (!acts.isEmpty) {
      for (var i = 0; i < acts.length; i++) {
        final a = Actividad(acts[i]);
        actividades.add(a);
      }
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "completo": completo,
        "descripcion": descripcion,
        // "fiesta": fiesta,
        "latitud": latitud,
        "longitud": longitud,
        "clima": clima,
        "img": img,
        "historia": historia,
        "ubicacionText": ubicacionText,
      };
}
