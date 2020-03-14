import 'package:flutter/material.dart';

import 'package:timing_ready/src/models/evento_model.dart';
import 'package:timing_ready/src/providers/eventos_provider.dart';

class DetalleParticipante extends StatefulWidget {

  @override
  _DetalleParticipanteState createState() => _DetalleParticipanteState();
}

class _DetalleParticipanteState extends State<DetalleParticipante> {
  
  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = 
  //   new GlobalKey<RefreshIndicatorState>();

  final eventosProvider = EventosProvider();
  
  EventoModel evento = EventoModel();
  Participantes participante = Participantes();
  
  @override
  Widget build(BuildContext context) {

    final Participantes participantes = ModalRoute.of(context).settings.arguments;
    if ( participantes != null ) {
      participante = participantes;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFF249FE2),
        ),
      ),
      floatingActionButton: _refreshBottom(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
              children: <Widget>[
                _encabezadoParticipante(context, AssetImage("assets/icon/info_corredor.png"), participantes),
                Container(
                  color: Color(0xFF249FE2),
                  child: _nombres(),
                ),
                SizedBox(height: 15.0),
                _tiempos(),
                Container(
                  child: Text("POSICIÓN",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "Lato_LightItalic",
                      fontStyle: FontStyle.italic
                    ),
                  ),
                ),
                _posicion(),
                SizedBox(height: 35.0),
                _velocidad(),
                SizedBox(height: 15.0),
                Container(foregroundDecoration: BoxDecoration(
                  color: Colors.grey,
                  backgroundBlendMode: BlendMode.saturation),
                  child:_mapa("Ver En Mapa(Proximamente)")
                ),
              ],
            ),
        ),
      ),
    );
  }

  Future<Null> _refresh() {
    return eventosProvider.cargarParticipantes(evento, participante).then((detalleCorredor) {
      setState (() => detalleCorredor = detalleCorredor);
    });
  }

  Widget _backBottom() {
    return FloatingActionButton(
      mini: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: Icon(
        Icons.arrow_back,
        size: 40.0,
        color: Colors.black,
      ),
      onPressed: (){
        Navigator.pop(context);
      },
    );
  }

  Widget _refreshBottom() {
    return FloatingActionButton(
      heroTag: null,
      elevation: 0.0,
      backgroundColor: Color(0xFF249FE2),
      child: Icon(
        Icons.refresh,
        size: 45.0,
        color: Colors.white
      ),
      onPressed: (){_refresh();},
    );
  }

  Widget _encabezadoParticipante(BuildContext context, AssetImage image, Participantes participantes,) {
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
                child: Text('Info Corredor',
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
            ),
            Image(image: image,
            height: 90,
            width: 85,
            ),
          ],
        ),
      ),
    );
  }

  Widget _nombres() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text("${participante.dorsal}",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontFamily: "Lato_LightItalic",
                fontStyle: FontStyle.italic
              ),),
            ),
          //SizedBox(width: 05.0,),
          Expanded(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(" - ${participante.apellido}",
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontFamily: "Lato_LightItalic",
                fontStyle: FontStyle.italic
              ),),
            ),
          )
        ],
      ),
    );
  }

  Widget _tiempos() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Text("Tiempo Total",
          textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: "Lato_LightItalic",
              fontStyle: FontStyle.italic
            ),
          ),
          SizedBox(width: 15.0,),
          Expanded(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text("${participante.tiempoFinal}",
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF249FE2),
                  fontFamily: "Lato_LightItalic",
                  fontStyle: FontStyle.italic
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _posicion() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("${participante.posicionGeneral}",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF249FE2),
                    fontFamily: "Lato_LightItalic",
                    fontStyle: FontStyle.italic
                  ),
                ),
                Text("EN LA GENERAL",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: "Lato"
                  ),
                )
              ],
            ),
            SizedBox(width: 30.0,),
            Column(
              children: <Widget>[
                Text("${participante.posicion}",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF249FE2),
                    fontFamily: "Lato_LightItalic",
                    fontStyle: FontStyle.italic
                  ),
                ),
                Text("EN SU CATEGORIA",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: "Lato"
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }

  Widget _velocidad() {
    return Column(
      children: <Widget>[
        Text("VELOCIDAD PROMEDIO",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.normal,
            color: Color(0xFF249FE2),
            fontFamily: "Lato_LightItalic",
            fontStyle: FontStyle.italic
          ),
        ),
        Text("${participante.velocidad} KM/H",
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontFamily: "Lato_LightItalic",
            fontStyle: FontStyle.italic
          ),
        )
      ],
    );
  }

  Widget _mapa(String nombre) {
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
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(nombre,
                    textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: false,
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
              ],
            ),
          )
        ),
      ),
    );
  }

}