import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/logo.dart';
import 'package:graduate/components/text_field.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/constants/links.dart';
import 'package:graduate/services/login.dart';

// ignore: must_be_immutable
class SignUpTrainee extends StatefulWidget {
  const SignUpTrainee({super.key});

  @override
  State<SignUpTrainee> createState() => _SignUpTraineeState();
}

class _SignUpTraineeState extends State<SignUpTrainee> {
  final Crud _crud = Crud();

  bool isLoading = false;
  late List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController disAbility = TextEditingController();
  bool isSelectedG = true;
  bool isSelectedD = true;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  signUpTr() async {
    isLoading = true;
    setState(() {});
    if (formState.currentState!.validate()) {
      var response = await _crud.postRequest(linkSignUpTr, {
        "username": username.text,
        "password": password.text,
        "firstName": fName.text,
        "lastName": lName.text,
        "phoneNumber": phoneNumber.text,
        "Gender": gender.text,
        "disability": disAbility.text,
      });
      if (response["status"]) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Success 👀',
            desc: 'you are login successfuly now',
            btnOk: Center(
              child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(baseColor)),
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/home', (route) => false);
                },
              ),
            )).show();
      } else if (!response["status"]) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Invalid Info ☠️',
          desc: response["message"],
        ).show();
      }
    } else {
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        autoHide: const Duration(seconds: 4),
        title: 'Oops! ☠️☠️',
        desc: 'Please make sure all fields are filled out correctly.',
      ).show();
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
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
                        'Sign Up as Trainee',
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
                              controller: disAbility,
                              errorText: !isSelectedD ? 'choose!!' : null,
                              hintText: "Disability",
                              onSelected: (value) {
                                setState(() {
                                  isSelectedD = true;
                                  disAbility.text = value.toString();
                                });
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
                                const DropdownMenuEntry(
                                    value: 'arm', label: "Arm"),
                                const DropdownMenuEntry(
                                    value: 'leg', label: "Leg"),
                              ]),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: DropdownMenu(
                                inputDecorationTheme:
                                    const InputDecorationTheme(
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
                                controller: gender,
                                errorText: !isSelectedG ? 'choose!!' : null,
                                onSelected: (value) {
                                  setState(() {
                                    isSelectedG = true;
                                    gender.text = value.toString();
                                  });
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
                          onTab: () {
                            if (disAbility.text == '') {
                              isSelectedD = false;
                            }
                            if (gender.text == '') {
                              isSelectedG = false;
                            }
                            signUpTr();
                          },
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
