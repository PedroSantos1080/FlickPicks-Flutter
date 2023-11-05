import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  var valorDigitado = "";
  HomePage({super.key, required this.valorDigitado});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
      Scaffold(
        body: Container(
          
        ),
      ),

    );
  }
}