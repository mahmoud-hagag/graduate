import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/logo.dart';
import 'package:graduate/components/text_field.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/constants/links.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/services/cache_helper.dart';
import 'package:graduate/services/login.dart';

// ignore: must_be_immutable
class LoginTrainee extends StatefulWidget {
  const LoginTrainee({super.key});

  @override
  State<LoginTrainee> createState() => _LoginTraineeState();
}

class _LoginTraineeState extends State<LoginTrainee> {
  final Crud _crud = Crud();
  TextEditingController phone = TextEditingController();
  bool isLoading = false;
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  loginTr() async {
    isLoading = true;
    setState(() {});
    if (formState.currentState!.validate()) {
      try {
        var response = await _crud.postRequest(
            linkLoginTr, {"mobile": phone.text, "password": password.text});
        if (response["status"]) {
          setState(() {
            CacheHelper.setData(
              key: 'uId',
              value: response['data']["token"]['original']['access_token'],
            );
            CacheHelper.setDataD(
              isDo: 'isD',
              vDo: 'user',
            );
            CacheHelper.setDataId(
              key: 'id',
              value: response['data']["token"]['original']['user']['id'],
            );
          iD = CacheHelper.getDataId(key: 'id');
          uId = CacheHelper.getData(key: 'uId');
          isD = CacheHelper.getDataD(isDo: 'isD');
          });
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
                        .pushNamedAndRemoveUntil('/NavTr', (route) => false);
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
            desc: response["msg"],
          ).show();
        }
      } catch (e) {
        // ignore: avoid_print
        print("Exception $e");
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
                        'Phone',
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
                        controller: phone,
                        label: 'Enter your phone',
                        icon: Icons.person,
                        keyType: TextInputType.phone,
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
                      const SizedBox(
                        height: 20,
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
                        height: 40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: 'Login',
                          color1: color1Button,
                          color2: color2Button,
                          onTab: () async {
                            await loginTr();
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
