import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/screens/users/homepage_trainee.dart';
import 'package:graduate/screens/profiles/profile_trainee.dart';
import 'package:graduate/screens/users/search_trainee.dart';
import 'package:graduate/screens/users/setting_trainee.dart';
import 'package:graduate/screens/users/show_workouts/workout_trainee.dart';

// ignore: must_be_immutable
class NavBarTR extends StatelessWidget {
 int? currentIndex=0;
  NavBarTR({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: currentIndex??0,
      length: 5,
      child: Scaffold(
        body:  const TabBarView(children: [
          HomeTr(),
          WorkOutTR(),
          SettingTr(),
          SearchTr(),
          ProfileTr(),
        ]),
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              backGround.withOpacity(.2),
              backGround.withOpacity(.5)
            ]),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(CupertinoIcons.home, size: 30.0),
              ),
              Tab(
                icon: Icon(Icons.fitness_center_sharp, size: 30.0),
              ),
              Tab(
                icon: Icon(CupertinoIcons.settings, size: 30.0),
              ),
              Tab(
                icon: Icon(Icons.search_sharp, size: 30.0),
              ),
              Tab(
                icon: Icon(Icons.person_outlined, size: 30.0),
              ),
            ],
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.transparent,
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
          ),
        ),
      ),
    );
  }
}