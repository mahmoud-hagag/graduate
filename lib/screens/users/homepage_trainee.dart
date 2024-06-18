import 'package:flutter/material.dart';
import 'package:graduate/components/custom_page_view.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/screens/users/programs.dart';
import 'package:graduate/screens/users/tab_bar_trainee.dart';

class HomeTr extends StatefulWidget {
  const HomeTr({super.key});

  @override
  State<HomeTr> createState() => _HomeTrState();
}

class _HomeTrState extends State<HomeTr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Header(
                  'Dear !!',
                  rightSide: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => NavBarTR(
                            currentIndex: 4,
                          ),
                        ),
                        (route) => false,
                      );
                    },
                    child: UserPhoto(
                      isDoctor: false,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 120,
                  child: PageViewCustom(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('overall progress:'),
                    Text('70%'),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        minHeight: 20,
                        backgroundColor: backGround,
                        valueColor: AlwaysStoppedAnimation<Color>(baseColor),
                        value: .7,
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: .7,
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Programs',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Set programs from here',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Programs(),
                                  ));
                                },
                                child: const SizedBox(
                                  width: 50,
                                  child: Center(child: Text('Go')),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 3,
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Workout',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Start now',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const SizedBox(
                                  width: 50,
                                  child: Center(child: Text('Go')),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 8,
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Doctors',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'See doctors from here',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const SizedBox(
                                  width: 50,
                                  child: Center(child: Text('Go')),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
