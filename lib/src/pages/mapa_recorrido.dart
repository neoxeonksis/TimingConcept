import 'package:flutter/material.dart';

class MapaRecorrido extends StatefulWidget {

  @override
  _MapaRecorridoState createState() => _MapaRecorridoState();
}

class _MapaRecorridoState extends State<MapaRecorrido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child:
        AppBar(
          backgroundColor: Color(0xFF249FE2),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _encabezadoDetalle("Mapa del Recorrido", AssetImage("assets/icon/mapa_recorrido.png") ),
           SizedBox(height: 40.0),
          _mapa()
        ],
      ),
    );
  }

Widget _encabezadoDetalle(String nombreEvento, AssetImage image ) {
    return Container(
      color: Colors.grey[600],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _backBottom(),
            Flexible(
              child: Text(nombreEvento,
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

Widget _mapa(){
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: AssetImage("assets/img/bikes_widescreen.jpg"),
            placeholder: AssetImage("assets/img/jar-loading.gif"),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 230.0,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow:  <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0),
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
}

}