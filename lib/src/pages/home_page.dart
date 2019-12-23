import 'package:flutter/material.dart';

import 'package:timing_ready/src/models/evento_model.dart';
import 'package:timing_ready/src/providers/eventos_provider.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final eventosProvider = new EventosProvider();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFF249FE2),
        ),
      ),
      body: Column(
        children: <Widget>[
          _encabezadoSeguimiento(),
          SizedBox(height: 05.0),
          _descripccion(),
          SizedBox(height: 05.0),
          Expanded(
            child: _crearListado(),
          )
        ],
      ),
    );
  }

  //Future<Null> refrescarPagina() async {
  //  final duration = new Duration ( seconds: 2 );
  //  new Timer( duration, () {
  //    
  //  });
  //}

  Widget _encabezadoSeguimiento() {
    return Container(
      color: Colors.grey[600],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: Text("Seguimiento en Tiempo Real",
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
            ),
            Image.asset("assets/icon/seguimiento_en_tiempo_real.png",
            scale: 04.0,
            fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget _descripccion() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Text("Aqui encontraras los eventos que se estan desarrollando ahora mismo",
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Lato",
              fontStyle: FontStyle.italic,
              fontSize: 28.0,
            ),
          ),
        ),
      );
    }

  Widget _crearListado() => FutureBuilder(
    future: eventosProvider.cargarEventos(),
    builder: (BuildContext context, AsyncSnapshot<List<EventoModel>> snapshot) {
      if ( snapshot.hasData ){
        final eventos = snapshot.data;
        return RefreshIndicator(
         onRefresh: (){},
          child: ListView.builder(
            itemCount: eventos.length,
            itemBuilder: (context, i) => _crearItem(context, eventos[i]),
          ),
        );
      } else {
        return Center(
          child: Image.asset("assets/img/jar-loading.gif")
        );
      }
    },
  );

  Widget _crearItem(BuildContext context,EventoModel evento) {
    return ListTile(
      title: Text("${evento.id}",
        style: TextStyle(
          fontFamily: "Lato",
          fontStyle: FontStyle.italic,
          fontSize: 23.0,
          color: Colors.black
        ),
      ),
      onTap: () => Navigator.pushNamed(context, "detalle", arguments: evento),
    );
  }



}