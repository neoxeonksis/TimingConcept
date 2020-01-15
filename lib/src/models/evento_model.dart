// To parse this JSON data, do
//
//     final eventoModel = eventoModelFromJson(jsonString);

//import 'dart:convert';
//
//EventoModel eventoModelFromJson(String str) => EventoModel.fromJson(json.decode(str));
//
//String eventoModelToJson(EventoModel data) => json.encode(data.toJson());
//
//class EventoModel {
//    String id;
//    String apellido;
//    int chip;
//    String nombre;
//    int numero;
//    String place;
//    String tiempo;
//
//    EventoModel({
//        this.id,
//        this.apellido,
//        this.chip,
//        this.nombre,
//        this.numero,
//        this.place,
//        this.tiempo,
//    });
//
//    factory EventoModel.fromJson(Map<String, dynamic> json) => EventoModel(
//        id        : json["id"],
//        apellido  : json["Apellido"],
//        chip      : json["Chip"],
//        nombre    : json["Nombre"],
//        numero    : json["Numero"],
//        place     : json["Place"],
//        tiempo    : json["Tiempo"],
//    );
//
//    Map<String, dynamic> toJson() => {
//        "id"        : id,
//        "Apellido"  : apellido,
//        "Chip"      : chip,
//        "Nombre"    : nombre,
//        "Numero"    : numero,
//        "Place"     : place,
//        "Tiempo"    : tiempo,
//    };
//}

//import 'dart:convert';
//
//EventoModel eventoModelFromJson(String str) => EventoModel.fromJson(json.decode(str));
//
//final eventoModel = eventoModelFromJson(eventoModel);
//
//String eventoModelToJson(EventoModel data) => json.encode(data.toJson());
//
//class EventoModel {
//    String id;
//    List<Dato> datos;
//
//    EventoModel({
//        this.id,
//        this.datos,
//    });
//
//    factory EventoModel.fromJson(Map<String, dynamic> json) => EventoModel(
//        id: json["id"],
//        datos: List<Dato>.from(json["datos"].map((x) => Dato.fromJson(x))),
//    );
//
//    Map<String, dynamic> toJson() => {
//        "id": id,
//        "datos": List<dynamic>.from(datos.map((x) => x.toJson())),
//    };
//}
//
//class Dato {
//    String apellido;
//    int chip;
//    String nombre;
//    int numero;
//    String place;
//    String tiempo;
//
//    Dato({
//        this.apellido,
//        this.chip,
//        this.nombre,
//        this.numero,
//        this.place,
//        this.tiempo,
//    });
//
//    factory Dato.fromJson(Map<String, dynamic> json) => Dato(
//        apellido  : json["Apellido"],
//        chip      : json["Chip"],
//        nombre    : json["Nombre"],
//        numero    : json["Numero"] == null ? null : json["Numero"],
//        place     : json["Place"],
//        tiempo    : json["Tiempo"],
//    );
//
//    Map<String, dynamic> toJson() => {
//        "Apellido"  : apellido,
//        "Chip"      : chip,
//        "Nombre"    : nombre,
//        "Numero"    : numero == null ? null : numero,
//        "Place"     : place,
//        "Tiempo"    : tiempo,
//    };
//}
//
//
//
//import 'dart:convert';
//
//class EventoModel {
//  String id;
//  List<Datos> datos;
//
//  EventoModel({this.id, this.datos});
//
//  factory EventoModel.fromJson(Map<String, dynamic> parsedJson) {
//
//    var list = parsedJson['datos'] as List;
//    print(list.runtimeType);
//    List<Datos> datosList = list.map((i) => Datos.fromJson(i)).toList();
//
//    return EventoModel(
//      id    : parsedJson['id'],
//      datos : datosList
//    );
//  }
//
//}
//
//class Datos {
//  String  datosApellido;
//  int     datosChip;
//  String  datosNombre;
//  String  datosNumero;
//  String  datosPlace;
//  String  datosTiempo;
//
//  Datos ({this.datosApellido, this.datosChip, this.datosNombre, this.datosNumero, this.datosPlace, this.datosTiempo});
//
//  factory Datos.fromJson(dynamic parsedJson) {
//    return Datos(
//      datosApellido :parsedJson ['apellido'],
//      datosChip     :parsedJson ['chip'],
//      datosNombre   :parsedJson ['nombre'],
//      datosNumero   :parsedJson ['numero'],
//      datosPlace    :parsedJson ['place'],
//      datosTiempo   :parsedJson ['tiempo']
//    );
//  }
//}
//


//import 'dart:convert';
//
//EventoModel eventoModelFromJson(String str) => EventoModel.fromJson(json.decode(str));
//
//String eventoModelToJson(EventoModel data) => json.encode(data.toJson());
//
//class EventoModel {
//    List<Id> id;
//
//    EventoModel({
//        this.id,
//    });
//
//    factory EventoModel.fromJson(Map<String, dynamic> json) => EventoModel(
//        id: List<Id>.from(json["id"].map((x) => Id.fromJson(x))),
//    );
//
//    Map<String, dynamic> toJson() => {
//        "id": List<dynamic>.from(id.map((x) => x.toJson())),
//    };
//}
//
//class Id {
//    String apellido;
//    int chip;
//    String nombre;
//    int numero;
//    String place;
//    String tiempo;
//
//    Id({
//        this.apellido,
//        this.chip,
//        this.nombre,
//        this.numero,
//        this.place,
//        this.tiempo,
//    });
//
//    factory Id.fromJson(Map<String, dynamic> json) =>  new Id(
//        apellido  : json["Apellido"],
//        chip      : json["Chip"],
//        nombre    : json["Nombre"],
//        numero    : json["Numero"] == null ? null : json["Numero"],
//        place     : json["Place"],
//        tiempo    : json["Tiempo"],
//    );
//
//    Map<String, dynamic> toJson() => {
//        "Apellido"  : apellido,
//        "Chip"      : chip,
//        "Nombre"    : nombre,
//        "Numero"    : numero == null ? null : numero,
//        "Place"     : place,
//        "Tiempo"    : tiempo,
//    };
//}


  class EventoModel {
    String id;
    String nombreEvento;
    List<Participantes> participantes;

    EventoModel({
      this.id,
      this.nombreEvento,
      this.participantes
    });

    factory EventoModel.fromJson(Map<String, dynamic> parsedJson){
      var list = parsedJson['participantes'] as List;
      print(list.runtimeType);
      List<Participantes> participantesList = list.map((i) => Participantes.fromJson(i)).toList();

      return EventoModel(
        id            : parsedJson ['id'],
        nombreEvento  : parsedJson ['nombreEvento'],
        participantes : participantesList
      );
    }
  }

  class Participantes {
    final String apellido;
    final int chip;
    final String nombre;
    final int numero;
    final String place;
    final String tiempo;

    Participantes({
      this.apellido,
      this.chip,
      this.nombre,
      this.numero,
      this.place,
      this.tiempo
    });

    factory Participantes.fromJson(Map<String, dynamic> parsedJson){
      return Participantes(
        apellido  : parsedJson['apellido'],
        chip      : parsedJson['chip'],
        nombre    : parsedJson['nombre'],
        numero    : parsedJson['numero'],
        place     : parsedJson['place'],
        tiempo    : parsedJson['tiempo']
      );
    }
  }
