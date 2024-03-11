import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/logo.dart';
import 'package:graduate/components/text_field.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/services/login.dart';

// ignore: must_be_immutable
class LoginTrainee extends StatefulWidget {
  const LoginTrainee({super.key});

  @override
  State<LoginTrainee> createState() => _LoginTraineeState();
}

class _LoginTraineeState extends State<LoginTrainee> {
  final Crud _crud = Crud();
  TextEditingController username = TextEditingController();
  bool isLoading = false;
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  loginTrainee() async {
    var response = await _crud.getRequest(
        "http://localhost/api2/api/user/login.php?username=${username.text}&password=${password.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: isLoading
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ListView(children: [
                Form(
                  key: formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(width: double.infinity, child: Logo()),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Login As Trainee',
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Login To Continue Using The App',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'User Name',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        obscureText: false,
                        controller: username,
                        label: 'Enter your user name',
                        icon: Icons.person,
                        validator: (p0) {
                          if (p0 == "") {
                            return "can't to be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: password,
                        obscureText: true,
                        label: 'Enter your password',
                        icon: CupertinoIcons.eye_slash_fill,
                        keyType: TextInputType.visiblePassword,
                        validator: (p0) {
                          if (p0 == "") {
                            return "can't to be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: const ButtonStyle(),
                            onPressed: () {},
                            child: RichText(
                              textAlign: TextAlign.end,
                              text: const TextSpan(
                                text: "Forgot password? ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 2.5,
                            ),
                          ),
                          Text(
                            '      Or with      ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 2.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: 'Login',
                          color1: color1Button,
                          color2: color2Button,
                          onTab: () async {
                            await loginTrainee();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/sign_uptrainee');
                        },
                        highlightColor: Colors.white,
                        child: const Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't have an account?  ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    color: baseColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
    );
  }
}
