// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/foundation.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/firstpage.dart';
import 'package:graduate/screens/doctors/tab_bar.dart';
import 'package:graduate/screens/users/tab_bar_trainee.dart';
import 'package:graduate/services/cache_helper.dart';
import 'package:graduate/services/dio_helper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/screens/auth/logindoctor.dart';
import 'package:graduate/screens/auth/logintrainee.dart';
import 'package:graduate/screens/auth/sign_updoctor.dart';
import 'package:graduate/screens/auth/sign_uptrainee.dart';
import 'package:lottie/lottie.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
   uId = CacheHelper.getData(key: 'uId');
   isD = CacheHelper.getDataD(isDo: 'isD');
  if (kDebugMode) {
    print(uId);
    print(isD);
  }
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
        '/NavDo': (context) => NavBarDo(),
        '/NavTr': (context) => NavBarTR(),
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
      title: 'So3od',
      home: const SplachScreen(),
    );
  }
}

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
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
            nextScreen: CacheHelper.getData(key: 'uId') == null
                ? const FirstPage()
                : CacheHelper.getData(key: 'isD') == 'doctor'
                    ? NavBarDo()
                    : NavBarTR(),
            duration: 3000,
            splashTransition: SplashTransition.fadeTransition,
            splashIconSize: 350,
            pageTransitionType: PageTransitionType.bottomToTop,
            animationDuration: const Duration(seconds: 3),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50, left: 10),
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
