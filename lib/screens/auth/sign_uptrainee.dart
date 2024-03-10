import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/logo.dart';
import 'package:graduate/components/text_field.dart';
import 'package:graduate/constants/colors.dart';

// ignore: must_be_immutable
class SignUpTrainee extends StatefulWidget {
  const SignUpTrainee({super.key});

  @override
  State<SignUpTrainee> createState() => _SignUpTraineeState();
}

class _SignUpTraineeState extends State<SignUpTrainee> {
  late List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController disAbility = TextEditingController();
  TextEditingController gender = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [
          Form(
            key: formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: double.infinity, child: Logo()),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Sign Up As  Trainee',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
                  keyType: TextInputType.name,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownMenu(
                        inputDecorationTheme: const InputDecorationTheme(
                          fillColor: Colors.transparent,
                          filled: false,
                          enabledBorder: InputBorder.none,
                        ),
                        width: 150,
                        menuStyle: const MenuStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 120, 66, 3)),
                          elevation: MaterialStatePropertyAll(6),
                        ),
                        hintText: "Disability",
                        onSelected: (value) {
                          setState(() => disAbility.text = value.toString());
                        },
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownMenuEntries: dropdownMenuEntries = [
                          const DropdownMenuEntry(
                              value: 'upper', label: "Upper"),
                          const DropdownMenuEntry(
                              value: 'lower', label: "Lower"),
                          const DropdownMenuEntry(value: 'arm', label: "Arm"),
                          const DropdownMenuEntry(value: 'leg', label: "Leg"),
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: DropdownMenu(
                          inputDecorationTheme: const InputDecorationTheme(
                            fillColor: Colors.transparent,
                            filled: false,
                            enabledBorder: InputBorder.none,
                          ),
                          menuStyle: const MenuStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 120, 66, 3)),
                            elevation: MaterialStatePropertyAll(6),
                          ),
                          hintText: "Gender",
                          onSelected: (value) {
                            setState(() => gender.text = value.toString());
                          },
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          dropdownMenuEntries: dropdownMenuEntries = [
                            const DropdownMenuEntry(
                                value: 'male', label: "Male"),
                            const DropdownMenuEntry(
                                value: 'female', label: "Female"),
                          ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Text(
                      'First Name',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 120),
                      child: Text(
                        'Last Name',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: fName,
                        validator: (value) {
                          if (value!.isEmpty || value.trim() == '') {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                        label: 'Here...',
                        icon: null,
                        obscureText: false,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: lName,
                        validator: (value) {
                          if (value!.isEmpty || value.trim() == '') {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                        label: 'Here...',
                        icon: null,
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Phone',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  validator: (p0) {
                    if (p0 == "") {
                      return "can't to be empty";
                    } else {
                      return null;
                    }
                  },
                  controller: phoneNumber,
                  label: 'Enter your Phone Number',
                  icon: Icons.phone_enabled,
                  keyType: TextInputType.phone,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Sign Up',
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
                    Navigator.pop(context);
                  },
                  highlightColor: Colors.white,
                  child: const Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Do you have an account?  ",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'Login',
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
