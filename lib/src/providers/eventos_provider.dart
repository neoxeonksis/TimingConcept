import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:timing_ready/src/models/evento_model.dart';

class EventosProvider {

  final String _url = "https://timing-readycronometraje.firebaseio.com";

  Future<List<EventoModel>> cargarEventos() async {

    final url ="$_url/eventos.json";
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final List<EventoModel> eventos = new List();

    if (decodedData == null) return [];

    decodedData.forEach(( id, evento ){

      final eventoTemp = EventoModel.fromJson(evento);
      eventoTemp.id = id;
      eventos.add( eventoTemp );

      print(id);

    });
    

    return eventos;

  }

}