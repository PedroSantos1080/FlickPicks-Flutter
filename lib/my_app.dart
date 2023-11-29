//import 'package:flickpicks/pages/cadastro_page.dart';
import 'package:flickpicks/main.dart';
//import 'package:flickpicks/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //tira a barrinha "debug"
      theme: ThemeData(
      textTheme: GoogleFonts.robotoTextTheme()), //Propreiedades de cores, fontes etc
      
      home: const RoteadorTela(),
    );
  }
}