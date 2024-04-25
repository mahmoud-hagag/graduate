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
                      const Text('Your Name',
                        style: TextStyle(fontSize: 18),),
                      IconButton(
                          onPressed: () {},
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
                      const Text('Phone',
                        style: TextStyle(fontSize: 18),),
                      IconButton(
                          onPressed: () {},
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
                      const Text('Gender',
                        style: TextStyle(fontSize: 18),),
                      IconButton(
                          onPressed: () {},
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
                          onPressed: () {},
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
