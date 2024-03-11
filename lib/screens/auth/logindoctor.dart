// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/logo.dart';
import 'package:graduate/components/text_field.dart';
import 'package:graduate/constants/colors.dart';

// ignore: must_be_immutable
class LoginDoctor extends StatefulWidget {
  const LoginDoctor({super.key});

  @override
  State<LoginDoctor> createState() => _LoginDoctorState();
}

class _LoginDoctorState extends State<LoginDoctor> {
  TextEditingController email = TextEditingController();
  bool isLoading = false;
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(115, 81, 77, 77),
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
                        'Login As Doctor',
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
                        'User name',
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
                        controller: email,
                        label: 'Enter your user name',
                        icon: Icons.email_rounded,
                        keyType: TextInputType.emailAddress,
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
                          onTab: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/sign_updoctor');
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
                                    color: Color.fromARGB(255, 255, 123, 7),
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
