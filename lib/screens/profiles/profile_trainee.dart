import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/screens/users/tab_bar_trainee.dart';
import 'package:graduate/services/cache_helper.dart';

class ProfileTr extends StatefulWidget {
  const ProfileTr({super.key});

  @override
  State<ProfileTr> createState() => _ProfileTrState();
}

class _ProfileTrState extends State<ProfileTr> {
  void viewProfile() async {
    setState(() {});
    try {
      uId = CacheHelper.getData(key: 'uId');
      var response = await Dio().post(
        'http://10.0.2.2:8000/api/auth/user/userProfile',
        options: Options(
          headers: {'Authorization': 'Bearer $uId'},
        ),
      );
      if (response.data["status"]) {
        
        // ignore: use_build_context_synchronously
        AwesomeDialog(
            context: context,
            dialogType: DialogType.infoReverse,
            animType: AnimType.rightSlide,
            title:
                "First Name: ${response.data['user']['firstName']}\n\nLast Name: ${response.data['user']['lastName']}\n\nPhone: ${response.data['user']['mobile']}\n\nGender: ${response.data['user']['gender']}\n\nDisability: ${response.data['user']['disability']}",
            desc:
                '\nCreated at: ${response.data['user']['created_at'].toString().substring(0, 10)}\nto back press anywhere or press ok',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  'Profile',
                  rightSide: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: backGround.withOpacity(.7),
                          borderRadius: BorderRadius.circular(25)),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => NavBarTR(
                                  currentIndex: 2,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            size: 35,
                            Icons.settings,
                            color: baseColor,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: SizedBox(
                    width: 130,
                    height: 130,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage('assets/user.jpg'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: GestureDetector(
                    onTap: () async {
                      viewProfile();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'View Profile',
                            style: TextStyle(fontSize: 22),
                          ),
                          Icon(Icons.receipt_long_rounded)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
