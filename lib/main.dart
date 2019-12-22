import 'package:flutter/material.dart';
import 'package:timing_ready/src/pages/detalle_evento.dart';
import 'package:timing_ready/src/pages/home_page.dart';
//import 'package:timing_ready/src/pages/mapa_recorrido.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TimingReady',
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
         "home" : (BuildContext context) => HomePage(),
         "detalle" : (BuildContext context) => DetalleEvento(),
         //"mapaRecorrido" : (BuildContext context) => MapaRecorrido(),
      },
    );
  }
}