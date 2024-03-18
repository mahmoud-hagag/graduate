import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/screens/doctors/homepage.dart';
import 'package:graduate/screens/doctors/profile.dart';
import 'package:graduate/screens/doctors/search.dart';
import 'package:graduate/screens/doctors/setting.dart';
import 'package:graduate/screens/doctors/workout.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: const TabBarView(children: [
          HomeDo(),
          WorkOut(),
          Setting(),
          Search(),
          Profile(),
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