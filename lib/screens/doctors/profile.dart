import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';

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
                          onPressed: () {},
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
                SizedBox(
                  width: 130,
                  height: 130,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage('assets/doctor.png'),
                    ),
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
