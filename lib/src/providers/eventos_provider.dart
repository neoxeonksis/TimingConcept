import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:timing_ready/src/models/evento_model.dart';

class EventosProvider {

  final String _url = "https://timing-readycronometraje.firebaseio.com";

  Future<List<EventoModel>> cargarEventos() async {
    
    final url  = "$_url/eventos.json";
    final resp = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<EventoModel> eventos = new List();
    if (decodedData == null) return [];
    decodedData.forEach( ( id, event ) {
      final evenTemp = EventoModel.fromJson(event);
      evenTemp.id = id;
      eventos.add(evenTemp);
    });
    return eventos;
    
  }

  Future<List<Participantes>> cargarParticipantes( EventoModel evento, Participantes participantes ) async {

    final url = "$_url/eventos/${ evento.id }/participantes.json";
    final resp = await http.get(url);
    final respBody = json.decode(resp.body) as List;
    final participantes = respBody.map((x) => Participantes.fromJson(x)).toList();
    return participantes;

  }

  Future<List<Participantes>> buscarParticipantes( EventoModel evento, Participantes participantes ) async {

    final url = "$_url/eventos/evbsd5132s/participantes.json";
    final resp = await http.get(url);
    final respBody = json.decode(resp.body) as List;
    final participantes = respBody.map((x) => Participantes.fromJson(x)).toList();
    return participantes;

  }

}