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
      //print(list.runtimeType);
      List<Participantes> participantesList = list.map((i) => Participantes.fromJson(i)).toList();
      return EventoModel(
        id            : parsedJson ['id'],
        nombreEvento  : parsedJson ['nombreEvento'],
        participantes : participantesList
      );
    }
  }

  class Participantes {
  String uniqueId;
  String apellido;
  int chip;
  String nombre;
  int numero;
  String place;
  String tiempo;

  Participantes({
    this.apellido,
    this.chip,
    this.nombre,
    this.numero,
    this.place,
    this.tiempo,
  });

  factory Participantes.fromJson(Map<String, dynamic> parsedJson) {
    //print(list.runtimeType);
    return Participantes(
      apellido  : parsedJson['Apellido'],
      chip      : parsedJson['Chip'],
      nombre    : parsedJson['Nombre'],
      numero    : parsedJson['Numero'],
      place     : parsedJson['Place'],
      tiempo    : parsedJson['Tiempo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Apellido'  : apellido,
      'Chip'      : chip,
      'Nombre'    : nombre,
      'Numero'    : numero,
      'Place'     : place,
      'Tiempo'    : tiempo,
    };
  }
}
