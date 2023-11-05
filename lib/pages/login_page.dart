import 'package:flickpicks/pages/cadastro_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = TextEditingController(
      text: ""); //text: "exemplo@gmail.com"); - caso eu queria que os campos
  var senha =
      TextEditingController(text: ""); //text: "exemplo"); já venham preenchidos
  var passw = true;
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

            //  appBar: AppBar(
            //  backgroundColor:Color.fromARGB(156, 255, 25, 0),
            //title: Text(
            //"FlickPicks",
            //style:
            //GoogleFonts.roboto(fontSize: 12),
            //),
            //),
            body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/imagens/fundo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        //
        child: ConstrainedBox(
          //Informa em qual tamanho o app deve rodar
          constraints: BoxConstraints(
            //
            maxHeight: MediaQuery.of(context).size.height, //
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            //Espaçamento na parte superior, entre o topo e o próximo componente.
            const SizedBox(
              height: 40,
            ),
            Text(
              "FlickPicks",
              style: GoogleFonts.inter(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),

            const SizedBox(
              height: 50,
            ),

            //Icone de login
            Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                Expanded(
                    flex: 1, child: Image.asset('assets/imagens/png_logo.png')),
                Expanded(
                  child: Container(),
                ),
              ],
            ),

            //Espaçamento entre o icon de login e o próximo componente.
            const SizedBox(
              height: 40,
            ),

            const Text(
              "Já tem cadastro?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Faça seu login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            //Container que contém a área de inserção de email.
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              child: TextField(
                controller: email,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: -3),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color.fromRGBO(116, 29, 29, 1),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //Container que contém a área de inserção de senha.
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              child: TextField(
                controller: senha,
                obscureText: passw,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: -3),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Senha",
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color.fromRGBO(116, 29, 29, 1),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          passw = !passw;
                        });
                      },
                      child: Icon(
                        passw ? Icons.visibility_off : Icons.visibility,
                        color: const Color.fromRGBO(116, 29, 29, 1),
                      ),
                    )),
              ),
            ),

            //Componente usado para ocupar uma certa área existente, no caso ele ocupa
            //toda área entre o container da senha e o próximo componente.
            //Espaçamento entre o botão de login e o próximo componente.
            const SizedBox(
              height: 30,
            ),

            //Contianer que contém o botão de login.
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        //trim() é utilizado para evitar erro caso o user coloque espaços adicionais.
                        if (email.text.trim() == "pedro@gmail.com" && senha.text.trim() == "1234") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Login efetuado com sucesso!")));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Erro ao efetuar o login!")));
                        }
                      });
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(126, 29, 29, 1)),
                    ),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    )),
              ),
            ),

            Expanded(child: Container()),

            //Espaçamento entre o botão de login e o próximo componente.
            const SizedBox(
              height: 20,
            ),

            //Container que contém a opção de "cadastro"
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              child: const Text(
                "Esqueci minha senha",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const RegisterPage()));
                },
                child: const Text(
                  "Criar conta",
                  style:
                      TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
            ),

            //Espaçamento entre a opção de cadastro e o próximo componente.
            const SizedBox(
              height: 60,
            ),
          ]),
        ),
      ),
    )));
  }
}
