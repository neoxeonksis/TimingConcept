import 'package:flutter/material.dart';

import 'package:timing_ready/src/models/evento_model.dart';
import 'package:timing_ready/src/providers/eventos_provider.dart';

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

  Widget _crearListadoParticipantes() {
    return FutureBuilder<List<Participantes>>(
      future: eventosProvider.cargarParticipantes(evento, participantes),
      builder: (context, snapshot) {
        print(snapshot?.data?.length);
        if ( snapshot.hasData ) {
          final participantes = snapshot.data;
          return ListView.builder(
            itemCount: participantes.length,
            //itemBuilder: (context, i) => _crearParticipante(context, participantes[i]),
            itemBuilder: (context, i) { 
              //return Text("${participantes[i]}");
              return _crearParticipante(context, participantes[i]);
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

  Widget _crearParticipante(BuildContext context, Participantes participantes) {
    print(participantes.nombre);
    return ListTile(
      title: Text('${ participantes.nombre } + ${ participantes.apellido }',
        textAlign: TextAlign.left,
        softWrap: true,
        style: TextStyle(
          color: Colors.red,
          fontFamily: "Lato",
          fontStyle: FontStyle.italic,
          fontSize: 25.0,
          fontWeight: FontWeight.w300
        ),
      ),
    );
  }

}