import 'package:firebase_auth/firebase_auth.dart';
import 'package:flickpicks/my_app.dart';
import 'package:flickpicks/pages/cadastro_page.dart';
import 'package:flickpicks/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(stream: FirebaseAuth.instance.userChanges(),builder: (context, snapshot) {
      if (snapshot.hasData) {
        return const HomePage();
      }else {
        return const RegisterPage();
      }
    } ,);
  }
}