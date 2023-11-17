import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PageState();
}

class _PageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions:<Widget>[
                IconButton(
                  icon: const Icon(Icons.person, size: 40, color: Colors.white,),
                  onPressed: () {
                    setState(() {
                        Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => const PerfilPage()));       
                    });
                  },
                  
            )],
                backgroundColor: const Color.fromRGBO(116, 29, 29, 1),
                title: Text("FlickPicks")),
            body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/imagens/fundo.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  //
                  child: ConstrainedBox(
                    //Informa em qual tamanho o app deve rodar
                    constraints:
                        const BoxConstraints(maxHeight: double.infinity //
                            ),
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Seja bem vindo", style: TextStyle(
                            color: Colors.white
                          ),)
                        ]),
                  ),
                ))));
  
  }
}
