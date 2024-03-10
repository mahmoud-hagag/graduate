import 'package:flutter/material.dart';
import 'package:graduate/firstpage.dart';
import 'package:graduate/screens/auth/logindoctor.dart';
import 'package:graduate/screens/auth/logintrainee.dart';
import 'package:graduate/screens/auth/sign_updoctor.dart';
import 'package:graduate/screens/auth/sign_uptrainee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/logindoctor': (context) => const LoginDoctor(),
        '/logintrainee': (context) => const LoginTrainee(),
        '/sign_uptrainee': (context) => const SignUpTrainee(),
        '/sign_updoctor': (context) => const SignUPDoctor(),
      },
      theme: ThemeData(
        primaryColor: Colors.amber,
        hintColor: Colors.orange,
        primaryColorDark: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const FirstPage(),
    );
  }
}
