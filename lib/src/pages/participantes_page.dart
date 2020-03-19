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

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = 
    new GlobalKey<RefreshIndicatorState>();

  final eventosProvider = new EventosProvider();

  TextEditingController controller = new TextEditingController();
  
  EventoModel evento = new EventoModel();
  Participantes participantes = new Participantes();

  
  
  @override
  Widget build(BuildContext context) {

    final EventoModel eventoData = ModalRoute.of(context).settings.arguments;
    if ( eventoData != null ) {
      evento = eventoData;
    }
    
    return Scaffold(
      floatingActionButton: _botonBusqueda(evento),
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
            _barraBusqueda(),
            _cuadroDatos(),
            Expanded(
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: _refresh,
                child: _crearListadoParticipantes()
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _refresh() {
    return eventosProvider.cargarParticipantes(evento, participantes).then((participantesListPage) {
      setState (() => participantesListPage = participantesListPage);
    });
  }

  Widget _backBottom() {
    return FloatingActionButton(
      heroTag: "back",
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
                    fontSize: 30.0,
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

  Widget _barraBusqueda() {
   return Padding(
     padding: EdgeInsets.all(0.0),
     child: ListTile(
       title: TextField(
         controller: controller,
         decoration: InputDecoration(
           hintText: "Buscar Numero ó Nombre"
         ),
         onChanged: (text){
         },
       ),
       trailing: IconButton(icon: Icon(Icons.cancel),
       onPressed: () {},
       ),
     ),
   );
  }

  Widget _cuadroDatos() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: 28,
        color: Color(0xFF249FE2),
        child: Row(
          children: <Widget>[
            Text(" Numero",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Lato_LightItalic",
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
                fontWeight: FontWeight.w300
              ),
            ),
            SizedBox(width: 15.0),
            Text("Apellidos",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Lato_LightItalic",
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
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
      padding: EdgeInsets.all(10.0),
      child: GestureDetector(
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

  Widget _botonBusqueda(EventoModel evento) {
    //print(evento.id);
    return FloatingActionButton(
      heroTag: "buscar",
      child: Icon(Icons.search),
      onPressed: (){
        showSearch(context: context, 
          delegate: DataSearch(),
        );
      },
    );
  }

}