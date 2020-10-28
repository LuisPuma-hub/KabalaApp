import 'package:flutter/material.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/calculo.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
    '/calculo': (context)=> calculo(),
  }
)
)
;