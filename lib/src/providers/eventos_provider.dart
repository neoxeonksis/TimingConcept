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
    //print(eventos[0].id);
    return eventos;
    
  }

Future<List<EventoModel>> cargarParticipantes( EventoModel evento ) async {
  
  final url = "$_url/eventos/${ evento.id }/participantes.json";
  final resp = await http.get(url);
  
  final List<dynamic> decodedData = json.decode(resp.body);
  
  if ( decodedData == null ) return [];
  decodedData.forEach(( arg1 ){
    print(arg1);
  });

  return [];

} 


}