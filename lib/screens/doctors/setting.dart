import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/setting_menu.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/screens/chats/home.dart';
import 'package:graduate/screens/doctors/helps.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                const Header(
                  'Settings',
                  rightSide: UserPhoto(),
                ),
                const SizedBox(
                  height: 50,
                ),
                SettingMenuWidget(
                  title: "Account",
                  icon: Icons.person_4,
                  onPress: () {},
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
                      builder: (context) => const HomeChat(),
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
                  title: "Logout",
                  icon: Icons.logout_rounded,
                  onPress: () {},
                  textColor: Colors.red,
                  iconColor: Colors.red,
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
