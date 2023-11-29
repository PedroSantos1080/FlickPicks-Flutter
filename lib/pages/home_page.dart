import 'package:flickpicks/api/autenticacao_firebase.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlickPicks"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Deslogar"),
              onTap: () {
                AutenticacaoFirebase().deslogar();
              },
            )
          ],
        ),
      ),
    );
  }
}