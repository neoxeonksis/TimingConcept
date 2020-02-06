import 'package:flutter/material.dart';

import 'package:timing_ready/src/models/evento_model.dart';
import 'package:timing_ready/src/providers/eventos_provider.dart';

class DataSearch extends SearchDelegate{

final eventosProvider = EventosProvider();
EventoModel evento =  EventoModel();
Participantes participantes =  Participantes();

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones del AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = " ";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builder de los resultados
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias al escribir
    if ( query.isEmpty ) {
      return Container();
    }

    return FutureBuilder<List<Participantes>>(
      future: eventosProvider.buscarParticipantes(evento, participantes),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final participantes = snapshot.data;
          return ListView.builder(
            itemCount: participantes.length,
            itemBuilder: (context, i) { 
              return _crearParticipante(context, participantes[i]);
            }
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  Widget _crearParticipante(BuildContext context, Participantes participantes) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: GestureDetector(
        child: RichText(
          softWrap: false,
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Lato_LightItalic",
              fontStyle: FontStyle.italic,
              fontSize: 20.0,
              fontWeight: FontWeight.w400
            ),
            children: [
              TextSpan(text: '     '+'${participantes.numero}',
                style: TextStyle(
                  fontWeight: FontWeight.w600
                )
              ),
              TextSpan(text: "           "),
              TextSpan(text: '${participantes.apellido} ${participantes.nombre}',)
            ],
          ),
        ),
        onTap: () => Navigator.pushNamed(context, 'destalleParticipante', arguments: participantes),
      ),
    );
  }
  
}