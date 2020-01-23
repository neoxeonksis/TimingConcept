import 'package:flutter/material.dart';

import 'package:timing_ready/src/models/evento_model.dart';
import 'package:timing_ready/src/providers/eventos_provider.dart';

class DetalleParticipante extends StatefulWidget {

  @override
  _DetalleParticipanteState createState() => _DetalleParticipanteState();
}

class _DetalleParticipanteState extends State<DetalleParticipante> {
  
  final eventosProvider = new EventosProvider();
  
  EventoModel evento = new EventoModel();
  Participantes participantes = new Participantes();
  
  @override
  Widget build(BuildContext context) {

    final EventoModel eventoData = ModalRoute.of(context).settings.arguments;
    if ( eventoData != null ) {
      evento = eventoData;
    }
      print(participantes.nombre);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFF249FE2),
        ),
      ),
      backgroundColor: Colors.white,
      body:  Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _encabezadoParticipante(context, AssetImage("assets/icon/info_corredor.png"), participantes, evento),
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

  Widget _encabezadoParticipante(BuildContext context, AssetImage image, Participantes participantes, EventoModel evento) {
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
                padding: EdgeInsets.all(8.0),
                child: Text('${participantes.apellido}',
                textAlign: TextAlign.center,
                  maxLines: 3,
                  softWrap: true,
                  style: TextStyle(                
                    color: Colors.white,
                    fontFamily: "Lato",
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Image(image: image,
            fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

}