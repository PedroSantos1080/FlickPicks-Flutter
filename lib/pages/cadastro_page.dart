import 'package:flickpicks/_comum/meu_snackbar.dart';
import 'package:flickpicks/api/autenticacao_firebase.dart';
import 'package:flickpicks/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  var username = TextEditingController(text: "");

  var email = TextEditingController(
      text: ""); //text: "exemplo@gmail.com"); - caso eu queria que os campos
  var senha =
      TextEditingController(text: ""); //text: "exemplo"); já venham preenchidos
  var passw = true;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  AutenticacaoFirebase _autenFire = AutenticacaoFirebase();
  bool queroEntrar = true;
  //final myController = TextEditingController();
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
              height: 20,
            ),
            Text(
              "FlickPicks",
              style: GoogleFonts.inter(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),

            const SizedBox(
              height: 30,
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

            Text(
              queroEntrar ? "Faça seu login" : "Cadastre-se",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: 300,
              child: Text(
                "Faça seu cadastro e aproveite nosso App da melhor forma!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            Form(
                key: _formKey,
                child: Column(
                  children: [
                    //Container que contém a área de iserção de username.
                    Visibility(
                      visible: !queroEntrar,
                      child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: 30,
                          child: TextFormField(
                            //controller: username,
                            controller: _nomeController,
                            validator: (String? value) {
                              if (value == null) {
                                return "O nome não pode ser vazio";
                              }
                              if (value.length < 5) {
                                return "O nome é muito curto";
                              }

                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(top: -3),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color.fromRGBO(116, 29, 29, 1),
                              ),
                            ),
                          )),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //Container que contém a área de inserção de email.
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      child: TextFormField(
                        //controller: email,
                        controller: _emailController,
                        validator: (String? value) {
                          if (value == null) {
                            return "O e-mail não pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "O e-mail é muito curto";
                          }

                          if (!value.contains("@")) {
                            return "O e-mail não é valido";
                          }
                          return null;
                        },
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
                      child: TextFormField(
                        //controller: senha,
                        controller: _senhaController,
                        validator: (String? value) {
                          if (value == null) {
                            return "A senha não pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "A senha é muito curto";
                          }

                          return null;
                        },
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
                  ],
                )),

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
                        Cadastrar();

                        //trim() é utilizado para evitar erro caso o user coloque espaços adicionais.
                        // if (email.text.trim() == "pedro@gmail.com" &&
                        //     senha.text.trim() == "1234") {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(
                        //           content:
                        //               Text("Login efetuado com sucesso!")));
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(
                        //           content: Text("Erro ao efetuar o login!")));
                        // }
                      });
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(126, 29, 29, 1)),
                    ),
                    child: Text(
                      queroEntrar ? "ENTRAR" : "CADASTRAR",
                      style: const TextStyle(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      queroEntrar = !queroEntrar;
                    });
                  },
                  child: Text(
                    queroEntrar ? "Cadastrar" : "Fazer login",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.white),
                  ),
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

  // ignore: non_constant_identifier_names
  Cadastrar() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_formKey.currentState!.validate()) {
   
      if (queroEntrar) {
        //Está efetuando o login - ja possui um login.
        print("Entrada Validada");
        _autenFire.logarUsuarios(email: email, senha: senha).then((String? erro) {
          if (erro != null) {
            mostrarSnackBar(context: context, texto: erro);
          }
        }); 
      } else {
        // Não tem um login, está efetuando o cadastro com novos dados.
        print("Cadastro Validado");
        print("${_emailController.text}, ${_senhaController.text}, ${_nomeController.text}");
        _autenFire
            .cadastrarUsuario(nome: nome, email: email, senha: senha)
            .then(
              (String? erro) => {
                if (erro != null) {
                  mostrarSnackBar(context: context, texto: erro)
                }
              },
              );
      }
    } else {
      print("Form inválido");
    }
  }
}
