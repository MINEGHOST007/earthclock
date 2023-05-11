import 'package:flutter/material.dart';
import 'package:earthclock/pages/home.dart';
import 'package:earthclock/pages/choose.dart';
import 'package:earthclock/pages/load.dart';


void main() {
  runApp(MaterialApp(
    // initialRoute: '/home',
    routes: {
      '/': (context)=> Loading(),
      '/home': (context)=> Home(),
      '/loc': (context)=> Chooseloc(),
    },
  ));
}
