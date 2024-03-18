import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';

class HomeDo extends StatefulWidget {
  const HomeDo({super.key});

  @override
  State<HomeDo> createState() => _HomeDoState();
}

class _HomeDoState extends State<HomeDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: const Column(
              children: [
                Header('Dear 7oda', rightSide: null)
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
