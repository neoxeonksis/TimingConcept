import 'package:flutter/material.dart';

import 'package:timing_ready/src/pages/home_page.dart';
import 'package:timing_ready/src/pages/evento_page.dart';
import 'package:timing_ready/src/pages/participantes_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TimingReady',
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "home"          : (BuildContext context) => HomePage(),
        "detalle"       : (BuildContext context) => EventoPage(),
        "participantes" : (BuildContext context) => ParticipantesPage()
      },
    );
  }
}