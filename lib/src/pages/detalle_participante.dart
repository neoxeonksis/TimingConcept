import 'package:flutter/material.dart';

import 'package:timing_ready/src/models/evento_model.dart';
import 'package:timing_ready/src/providers/eventos_provider.dart';

class DetalleParticipante extends StatefulWidget {

  @override
  _DetalleParticipanteState createState() => _DetalleParticipanteState();
}

class _DetalleParticipanteState extends State<DetalleParticipante> {
  
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
      backgroundColor: Colors.white,
      body:  Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _encabezadoParticipante(context, AssetImage("assets/icon/info_corredor.png"), participantes),
            SizedBox(width: 15.0),
            _nombres(),
            SizedBox(width: 15.0),
            _tiempos(),
            SizedBox(width: 15.0),
            _posicion(),
            SizedBox(width: 15.0),
            _numero(),
            SizedBox(width: 15.0),
            Container(foregroundDecoration: BoxDecoration(
              color: Colors.grey,
              backgroundBlendMode: BlendMode.saturation),
              child:_mapa("Ver En Mapa(Proximamente)")
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
            fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget _nombres() {
    return Padding(
      padding: EdgeInsets.all(10.0),
        child: ListTile(
          title: Text("Apellido: ${participante.apellido}",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Lato_LightItalic",
            fontStyle: FontStyle.italic,
            fontSize: 32.0,
            fontWeight: FontWeight.w400
            ),
          ),
          subtitle: Text("Nombre: ${participante.nombre}",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Lato_LightItalic",
            fontStyle: FontStyle.italic,
            fontSize: 28.0,
            fontWeight: FontWeight.w400
            ),
          ),
        )
    );
  }

  Widget _tiempos() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: ListTile(
        title: Text("Tiempo Chip:",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Lato_LightItalic",
            fontStyle: FontStyle.italic,
            fontSize: 32.0,
            fontWeight: FontWeight.w400
          ),
        ),
      subtitle: Text("${participante.tiempo}",
        style: TextStyle(
          color: Color(0xFF249FE2),
          fontFamily: "Lato_LightItalic",
          fontStyle: FontStyle.italic,
          fontSize: 42.0,
          fontWeight: FontWeight.w600
          ),
        ),
      )
    );
  }

  Widget _posicion() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: ListTile(
        title: Text("Posición",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Lato_LightItalic",
            fontStyle: FontStyle.italic,
            fontSize: 38.0,
            fontWeight: FontWeight.w400
          ),
        ),
      subtitle: Text("${participante.place}",
        style: TextStyle(
          color: Color(0xFF249FE2),
          fontFamily: "Lato_LightItalic",
          fontStyle: FontStyle.italic,
          fontSize: 60.0,
          fontWeight: FontWeight.w600
          ),
        ),
      )
    );
  }

  Widget _numero() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: ListTile(
        title: Text("Dorsal",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Lato_LightItalic",
            fontStyle: FontStyle.italic,
            fontSize: 38.0,
            fontWeight: FontWeight.w400
          ),
        ),
      subtitle: Text("${participante.numero}",
        style: TextStyle(
          color: Color(0xFF249FE2),
          fontFamily: "Lato_LightItalic",
          fontStyle: FontStyle.italic,
          fontSize: 56.0,
          fontWeight: FontWeight.w600
          ),
        ),
      )
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
              ],
            ),
          )
        ),
      ),
    );
  }

}