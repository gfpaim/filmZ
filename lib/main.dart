import 'package:flutter/material.dart';
import 'constantes.dart';
import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: PRETO,
        scaffoldBackgroundColor: PRETO,
        backgroundColor: PRETO,
      ),
      home: HomeScreen(title: 'FilmZ'),
    );
  }
}
