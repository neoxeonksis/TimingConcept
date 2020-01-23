import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:timing_ready/src/models/evento_model.dart';
import 'package:timing_ready/src/providers/eventos_provider.dart';

import 'package:timing_ready/src/providers/search_delegate.dart';

class ParticipantesPage extends StatefulWidget {

  @override
  _ParticipantesPageState createState() => _ParticipantesPageState();
}

class _ParticipantesPageState extends State<ParticipantesPage> {

  final eventosProvider = new EventosProvider();
  
  EventoModel evento = new EventoModel();
  Participantes participantes = new Participantes();
  
  @override
  Widget build(BuildContext context) {

    final EventoModel eventoData = ModalRoute.of(context).settings.arguments;
    if ( eventoData != null ) {
      evento = eventoData;
    }
    
    return Scaffold(
      floatingActionButton: _botonBusqueda(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFF249FE2),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _encabezadoParticipantes("Lista de Participantes", AssetImage("assets/icon/lista_participantes-1.png")),
            //SizedBox(height: 20.0,),
            //_barraBusqueda(),
            //SizedBox(height: 20.0,),
            _cuadroDatos(),
            Expanded(
              child: _crearListadoParticipantes(),
            )
          ],
        ),
      ),
    );
  }

  Widget _backBottom() {
    return FloatingActionButton(
      heroTag: "back",
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

  Widget _encabezadoParticipantes(String texto, AssetImage image) {
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
                child: Text(texto,
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
            Image(image: image,
            fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  //Widget _barraBusqueda() {
  //  return Padding(
  //    padding: EdgeInsets.all(0.0),
  //    child: ListTile(
  //      title: TextField(
  //        decoration: InputDecoration(
  //          hintText: "Buscar Numero ó Apellido"
  //        ),
  //        onChanged: (string){
  //          filtroParticipantes = evento.where((u) => (u.n))
  //        },
  //      ),
  //      trailing: IconButton(icon: Icon(Icons.cancel),
  //      onPressed: () {},
  //      ),
  //    ),
  //  );
  //}

  Widget _cuadroDatos() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: 30,
        color: Color(0xFF249FE2),
        child: Row(
          children: <Widget>[
            Text(" Numero",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Lato_LightItalic",
                fontStyle: FontStyle.italic,
                fontSize: 23.0,
                fontWeight: FontWeight.w300
              ),
            ),
            SizedBox(width: 20.0),
            Text("Apellidos",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Lato_LightItalic",
                fontStyle: FontStyle.italic,
                fontSize: 23.0,
                fontWeight: FontWeight.w300
              ),
            )
          ],
           mainAxisSize: MainAxisSize.max,
        ),
      ),
    );
  }

  Widget _crearListadoParticipantes() {
    return FutureBuilder<List<Participantes>>(
      future: eventosProvider.cargarParticipantes(evento, participantes),
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
        onTap: () => Navigator.pushNamed(context, 'destalleParticipante', arguments: evento),
      ),
    );
  }

  Widget _botonBusqueda() {
    return FloatingActionButton(
      heroTag: "buscar",
      child: Icon(Icons.search),
      onPressed: (){
        showSearch(context: context, 
        delegate: DataSearch(),
        //query: "Hola"
        );
      },
    );
  }

}