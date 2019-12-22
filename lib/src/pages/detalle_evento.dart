import 'package:flutter/material.dart';

import 'package:timing_ready/src/models/evento_model.dart';
import 'package:timing_ready/src/providers/eventos_provider.dart';

class DetalleEvento extends StatefulWidget {

  @override
  _DetalleEventoState createState() => _DetalleEventoState();
}

class _DetalleEventoState extends State<DetalleEvento> {
  final eventosProvider = new EventoModel();

  EventoModel evento = new EventoModel();

  @override
  Widget build(BuildContext context) {

    final EventoModel eventoData = ModalRoute.of(context).settings.arguments;
    if ( eventoData != null ) {
      evento = eventoData;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child:
        AppBar(
          backgroundColor: Color(0xFF249FE2),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _encabezadoDetalle( context, AssetImage("assets/icon/atletismo.png") ),
           SizedBox(height: 40.0),
           _botones(AssetImage("assets/icon/mapa_interactivo.png"), "Mapa Interactivo"),
           SizedBox(height: 40.0),
           _botones(AssetImage("assets/icon/lista_participantes.png"), "Listado de Participantes"),
           SizedBox(height: 40.0),
           _botones(AssetImage("assets/icon/resultados_finales.png"), "Resultados Finales"),
        ],
      ),
      
    );
  }

Widget _encabezadoDetalle(BuildContext context, AssetImage image) {
    return Container(
      color: Colors.grey[600],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _backBottom(),
            Flexible(
              child: Text(evento.id,
              textAlign: TextAlign.center,
                maxLines: 2,
                softWrap: true,
                style: TextStyle(                
                  color: Colors.white,
                  fontFamily: "Lato",
                  fontStyle: FontStyle.italic,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold
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

Widget _backBottom() {
  return FloatingActionButton(
    elevation: 20.0,
    backgroundColor: Colors.white,
    child: Icon(
      Icons.arrow_back,
      size: 45.0,
      color: Colors.black,
    ),
    onPressed: (){
      
    },
  );
}

Widget _botones(AssetImage icono ,String nombre,) {
  return MaterialButton(
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color.fromRGBO(36, 159, 226, 1.0),
        elevation: 10.0,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image(image: icono),
              Flexible(
                child: Text(nombre,
                textAlign: TextAlign.center,
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(                
                    color: Colors.white,
                    fontFamily: "Lato",
                    fontStyle: FontStyle.italic,
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    ),
  );
}
}