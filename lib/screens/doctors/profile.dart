import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/screens/doctors/tab_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => NavBarDo(
                                  currentIndex: 2,
                                ),
                              ),
                              (route) => false,
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
                        image: AssetImage('assets/doctor.png'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Your Name',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {
                            // ignore: use_build_context_synchronously
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.rightSlide,
                              title: 'change your name',
                              body: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: backGround,
                                    hintText: 'Enter new name',
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 16.0),
                                    contentPadding: const EdgeInsets.all(20.0),
                                  ),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              btnOkOnPress: () {
                                // ignore: avoid_print
                                print('ok');
                              },
                            ).show();
                          },
                          icon: const Icon(Icons.edit_outlined))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Phone',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {
                            // ignore: use_build_context_synchronously
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.rightSlide,
                              title: 'change phone',
                              body: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: backGround,
                                    hintText: 'Enter new phone',
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 16.0),
                                    contentPadding: const EdgeInsets.all(20.0),
                                  ),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              btnOkOnPress: () {
                                // ignore: avoid_print
                                print('ok');
                              },
                            ).show();},
                          icon: const Icon(Icons.edit_outlined))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Password',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {
                            // ignore: use_build_context_synchronously
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.rightSlide,
                              title: 'change passowrd',
                              body: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: backGround,
                                    hintText: 'Enter new password',
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 16.0),
                                    contentPadding: const EdgeInsets.all(20.0),
                                  ),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              btnOkOnPress: () {
                                // ignore: avoid_print
                                print('ok');
                              },
                            ).show();
                          },
                          icon: const Icon(Icons.edit_outlined))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
