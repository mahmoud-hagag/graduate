import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/text_field.dart';

// ignore: must_be_immutable
class SignUPDoctor extends StatefulWidget {
  const SignUPDoctor({super.key});

  @override
  State<SignUPDoctor> createState() => _SignUPDoctorState();
}

class _SignUPDoctorState extends State<SignUPDoctor> {
  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController password1 = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [
          Form(
            key: formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(width: double.infinity, child: Container()),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'User Name',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: (p0) {
                    if (p0 == "") {
                      return "can't to be empty";
                    } else {
                      return null;
                    }
                  },
                  controller: username,
                  label: 'Enter your User Name',
                  icon: Icons.person_rounded,
                  keyType: TextInputType.name, obscureText: false,
                ),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  obscureText: false,
                  validator: (p0) {
                    if (p0 == "") {
                      return "can't to be empty";
                    } else {
                      return null;
                    }
                  },
                  controller: email,
                  label: 'Enter your Email address',
                  icon: Icons.email_rounded,
                  keyType: TextInputType.emailAddress,
                ),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: (p0) {
                    if (p0 == "") {
                      return "can't to be empty";
                    } else {
                      return null;
                    }
                  },
                  controller: password,
                  obscureText: true,
                  label: 'Enter your password',
                  icon: CupertinoIcons.eye_slash_fill,
                  keyType: TextInputType.visiblePassword,
                ),
                const Text(
                  'Confirm Password',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: (p0) {
                    if (p0 == "") {
                      return "can't to be empty";
                    } else {
                      return null;
                    }
                  },
                  controller: password1,
                  obscureText: true,
                  label: 'Confirm password',
                  icon: CupertinoIcons.eye_slash_fill,
                  keyType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Sign Up',
                    color1: const Color.fromARGB(255, 35, 223, 18),
                    color2: const Color.fromARGB(255, 18, 81, 10),
                    onTab: () {},
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  highlightColor: Colors.white,
                  child: const Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "Do you have an account?  "),
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              color: Colors.amber,
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
