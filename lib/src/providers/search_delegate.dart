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
      builder: (context, snapshot) {
        if ( snapshot.hasData ) {
          final participantes = snapshot.data;
          return ListView.builder(
            itemCount: participantes.length,
            itemBuilder: (context, i) {
              return _crearParticipante(context, participantes[i], evento);
            }
          );
        } else if (snapshot.hasError){
          return Center(child: Text("${snapshot.error}"));
        } else {  
          return Center( child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearParticipante(BuildContext context, Participantes participantes, EventoModel evento) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: GestureDetector(
<<<<<<< HEAD
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
              TextSpan(text:'${participantes.numero}',
=======
        child: Card(
          elevation: 05.0,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0) ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 10.0,),
              Container(
                width: 60.0,
                child: Text("${participantes.dorsal}",
                textAlign: TextAlign.center,
>>>>>>> 984a1cd7f9b2ae0341b609c1b2a34098b5ffb0c4
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF249FE2),
                  fontFamily: "Lato_LightItalic",
                  fontStyle: FontStyle.italic
                ),),
              ),
              SizedBox(width: 16.0,),
              Expanded(
                child: Text("${participantes.apellido} ${participantes.nombre}",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: "Lato_LightItalic",
                  fontStyle: FontStyle.italic
                ),),
              )
            ],
          ),
        ),
        onTap: () => Navigator.pushNamed(context, 'destalleParticipante', arguments: participantes)
      ),
    );
  }

}