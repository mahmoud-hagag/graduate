import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/setting_menu.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/screens/chats/home_doctor.dart';
import 'package:graduate/screens/doctors/helps.dart';
import 'package:graduate/screens/doctors/tab_bar.dart';
import 'package:graduate/services/cache_helper.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isLoading = false;

  void viewProfile() async {
    setState(() {});
    try {
      uId = CacheHelper.getData(key: 'uId');
      var response = await Dio().post(
        'http://10.0.2.2:8000/api/auth/doctor/doctorProfile',
        options: Options(
          headers: {'Authorization': 'Bearer $uId'},
        ),
        data: {},
      );
      if (response.data["status"]) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
            context: context,
            dialogType: DialogType.infoReverse,
            animType: AnimType.rightSlide,
            title:
                "First Name: ${response.data['doctor']['firstName']}\n\nLast Name: ${response.data['doctor']['lastName']}\n\nPhone: 0${response.data['doctor']['mobile']}\n\nGender: ${response.data['doctor']['gender']}",
            desc:
                '\nCreated at: ${response.data['doctor']['created_at'].toString().substring(0, 10)}\nto back press anywhere or press ok',
            btnOk: Center(
              child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(baseColor)),
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )).show();
      } else if (!response.data["status"]) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Invalid Info ☠️',
          desc: response.data["error"],
        ).show();
      }
    } catch (e) {
      // ignore: avoid_print
      print("Exception $e");
    }
  }

  Future<void> logoutDoctor() async {
    isLoading = true;
    setState(() {});
    try {
      uId = CacheHelper.getData(key: 'uId');
      var response = await Dio().post(
        'http://10.0.2.2:8000/api/auth/doctor/logout',
        options: Options(
          headers: {'Authorization': 'Bearer $uId'},
        ),
        data: {},
      );
      if (response.data["status"]) {
        setState(() {
          CacheHelper.removeData(key: 'uId');
          CacheHelper.removeDataD(isDo: 'isD');
        });
        // ignore: use_build_context_synchronously
        AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Success 👀',
            desc: 'you are logout successfuly now',
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
                  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                },
              ),
            )).show();
      } else if (!response.data["status"]) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Invalid Info ☠️',
          desc: response.data["error"],
        ).show();
      }
    } catch (e) {
      // ignore: avoid_print
      print("Exception $e");
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Header(
                        'Settings',
                        rightSide: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => NavBarDo(
                                  currentIndex: 4,
                                ),
                              ),
                              (route) => false,
                            );
                          },
                          child: UserPhoto(
                            isDoctor: true,
                            ischat: false,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SettingMenuWidget(
                        title: "Account",
                        icon: Icons.person_4,
                        onPress: () async{
                          viewProfile();
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Colors.transparent,
                          Colors.grey.shade500,
                          Colors.transparent,
                        ])),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SettingMenuWidget(
                        title: "Help",
                        icon: Icons.question_mark_rounded,
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Helps(),
                          ));
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Colors.transparent,
                          Colors.grey.shade500,
                          Colors.transparent,
                        ])),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SettingMenuWidget(
                        title: "So3od Chat",
                        icon: Icons.send_rounded,
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeChatDoctor(),
                          ));
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Colors.transparent,
                          Colors.grey.shade500,
                          Colors.transparent,
                        ])),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onDoubleTap: () {
                          CacheHelper.removeData(key: 'uId');
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (_) => false);
                        },
                        child: SettingMenuWidget(
                          title: "Logout",
                          icon: Icons.logout_rounded,
                          onPress: () async {
                            await logoutDoctor();
                          },
                          textColor: Colors.red,
                          iconColor: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Colors.transparent,
                          Colors.grey.shade500,
                          Colors.transparent,
                        ])),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
