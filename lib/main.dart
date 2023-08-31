
import 'Pages/myExports.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(  MaterialApp(
    initialRoute: '/',
    routes: {
  '/' : (context) =>  Loading(),
  '/home': (context) =>  Home(),
  '/location': (context) =>  ChooseLocation(),
  },






  ));
}


