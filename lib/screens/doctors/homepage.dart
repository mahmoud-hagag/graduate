import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/screens/doctors/profile.dart';
import 'package:graduate/screens/doctors/search.dart';
import 'package:graduate/screens/doctors/setting.dart';
import 'package:graduate/screens/doctors/workout.dart';

class HomeDo extends StatefulWidget {
  const HomeDo({super.key});

  @override
  State<HomeDo> createState() => _HomeDoState();
}

class _HomeDoState extends State<HomeDo> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(CupertinoIcons.home, size: 26.0),
            ),
            Tab(
              icon: Icon(CupertinoIcons.bubble_left, size: 26.0),
            ),
            Tab(
              icon: Icon(Icons.insert_chart, size: 26.0),
            ),
            Tab(
              icon: Icon(Icons.person_outlined, size: 26.0),
            ),
            Tab(
              icon: Icon(Icons.person_outlined, size: 26.0),
            ),
          ],
          labelPadding: EdgeInsets.all(5.0),
          labelColor: baseColor,
          unselectedLabelColor: Colors.grey,
          indicatorWeight: 0.01,
        ),
      ),
    );
  }
}
