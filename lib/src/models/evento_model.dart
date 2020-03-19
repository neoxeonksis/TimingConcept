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
  String apellido;
  String categoria;
  dynamic chip;
  String concurso;
  dynamic dorsal;
  String posicion;
  String nombre;
  dynamic tiempoFinal;
  String tipoEvento;
  String velocidad;
  String posicionGeneral;

  Participantes({
    this.apellido,
    this.categoria,
    this.chip,
    this.concurso,
    this.dorsal,
    this.posicion,
    this.nombre,
    this.tiempoFinal,
    this.tipoEvento,
    this.velocidad,
    this.posicionGeneral
  });

  factory Participantes.fromJson(Map<String, dynamic> parsedJson) {
    return Participantes(
      apellido        : parsedJson['Apellido'],
      categoria       : parsedJson['Categoria'],
      chip            : parsedJson['Chip'],
      concurso        : parsedJson['Concurso'],
      dorsal          : parsedJson['Dorsal'],
      posicion        : parsedJson['Posicion'],
      nombre          : parsedJson['Nombre'],
      tiempoFinal     : parsedJson['TiempoFinal'],
      tipoEvento      : parsedJson['TipoEvento'],
      velocidad       : parsedJson['Velocidad'],
      posicionGeneral : parsedJson['PosicionGeneral']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Apellido'        : apellido,
      'Categoria'       : categoria,
      'Chip'            : chip,
      'Concurso'        : concurso,
      'Dorsal'          : dorsal,
      'Posicion'        : posicion,
      'Nombre'          : nombre,
      'TiempoFinal'     : tiempoFinal,
      'TipoEvento'      : tipoEvento,
      'Velocidad'       : velocidad,
      'PosicionGeneral' : posicionGeneral 
    };
  }
}
