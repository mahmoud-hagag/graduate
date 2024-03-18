// ignore_for_file: depend_on_referenced_packages

import 'package:graduate/screens/doctors/tab_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/screens/auth/logindoctor.dart';
import 'package:graduate/screens/auth/logintrainee.dart';
import 'package:graduate/screens/auth/sign_updoctor.dart';
import 'package:graduate/screens/auth/sign_uptrainee.dart';
import 'package:graduate/screens/doctors/homepage.dart';
import 'package:lottie/lottie.dart';

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
        '/homeDo': (context) => const HomeDo(),
      },
      theme: ThemeData(
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: baseColor,
              onPrimary: Colors.black,
              secondary: Colors.white,
              onSecondary: Colors.green,
              error: Colors.red,
              onError: Colors.red,
              background: backGround,
              onBackground: backGround,
              surface: backGround,
              onSurface: Colors.white)),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const SplachScreen(),
    );
  }
}

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSplashScreen(
            splash: Lottie.asset(
              'assets/splash.json',
            ),
            backgroundColor: const Color.fromARGB(255, 39, 34, 34),
            nextScreen: const NavBar(),
            duration: 3000,
            splashTransition: SplashTransition.fadeTransition,
            splashIconSize: 350,
            pageTransitionType: PageTransitionType.bottomToTop,
            animationDuration: const Duration(seconds: 3),
          ),
          const Padding(
            padding: EdgeInsets.only(top:50,left: 10),
            child: Text(
              'Welcome to our application\n\n                  S3ood',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
