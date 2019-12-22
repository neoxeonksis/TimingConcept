// To parse this JSON data, do
//
//     final eventoModel = eventoModelFromJson(jsonString);

import 'dart:convert';

EventoModel eventoModelFromJson(String str) => EventoModel.fromJson(json.decode(str));

String eventoModelToJson(EventoModel data) => json.encode(data.toJson());

class EventoModel {
    String id;
    String apellido;
    int chip;
    String nombre;
    int numero;
    int place;
    String tiempo;

    EventoModel({
        this.id,
        this.apellido = "",
        this.chip = 0000,
        this.nombre = "",
        this.numero = 0000,
        this.place = 0000,
        this.tiempo = "00:00:00",
    });

    factory EventoModel.fromJson(Map<String, dynamic> json) => new EventoModel(
        id        : json["id"],
        apellido  : json["Apellido"],
        chip      : json["Chip"],
        nombre    : json["Nombre"],
        numero    : json["Numero"],
        place     : json["Place"],
        tiempo    : json["Tiempo"],
    );

    Map<String, dynamic> toJson() => {
        "id"        : id,
        "Apellido"  : apellido,
        "Chip"      : chip,
        "Nombre"    : nombre,
        "Numero"    : numero,
        "Place"     : place,
        "Tiempo"    : tiempo,
    };
}
