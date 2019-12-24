import 'package:flutter/material.dart';

import 'package:timing_ready/src/models/evento_model.dart';
import 'package:timing_ready/src/providers/eventos_provider.dart';

class ListaParticipantes extends StatefulWidget {

  @override
  _ListaParticipantesState createState() => _ListaParticipantesState();
}

class _ListaParticipantesState extends State<ListaParticipantes> {
  final eventoProvider = new EventosProvider();

  EventoModel evento = new EventoModel();

  @override
  Widget build(BuildContext context) {

  final EventoModel eventoData = ModalRoute.of(context).settings.arguments;
  if ( eventoData == null ) {
      evento = eventoData;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFF249FE2),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _encabezadoListaParticipantes(AssetImage("assets/icon/lista_participantes-1.png"), "Listado de Participantes"),
            SizedBox(height: 05.0),
            _etiquetas(),
            Expanded(
              child: _crearListaParticipantes(),
            )
          ],
        ),
      ),
    );
  }

  Widget _encabezadoListaParticipantes(AssetImage icono ,String nombre) {
    return Container(
      color: Colors.grey[600],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _backBottom(),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(nombre,
                textAlign: TextAlign.center,
                  maxLines: 3,
                  softWrap: true,
                  style: TextStyle(                
                    color: Colors.white,
                    fontFamily: "Lato",
                    fontStyle: FontStyle.italic,
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Image(image: icono,
            fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget _backBottom() {
  return FloatingActionButton(
    elevation: 0.0,
    backgroundColor: Colors.white,
    child: Icon(
      Icons.arrow_back,
      size: 45.0,
      color: Colors.black,
    ),
    onPressed: (){
      Navigator.pop(context);
    },
  );
}

  Widget _etiquetas() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Numero",
            textAlign: TextAlign.center,
            maxLines: 2,
            softWrap: true,
            style: TextStyle(                
              color: Colors.white,
              fontFamily: "Lato",
              fontStyle: FontStyle.italic,
              fontSize: 40.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Text("Nombres",
          textAlign: TextAlign.center,
            maxLines: 2,
            softWrap: true,
            style: TextStyle(                
              color: Colors.white,
              fontFamily: "Lato",
              fontStyle: FontStyle.italic,
              fontSize: 40.0,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

  Widget _crearListaParticipantes() {
    return FutureBuilder(
      future: eventoProvider.cargarParticipantes(),
      builder: (BuildContext context, AsyncSnapshot<List<EventoModel>> snapshot){
        if (snapshot.hasData){

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) => _crearParticipantes(evento),
          );

        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearParticipantes(EventoModel evento) {
    return ListTile(
      title: Text("${evento.nombre} - ${evento.apellido}"),
      subtitle: Text(evento.id),
    );
  }




}