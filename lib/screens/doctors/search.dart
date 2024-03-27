import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/user_photo.dart';

class Search extends StatelessWidget {
  const Search({super.key});

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
                Header(
                  'Search',
                  rightSide: UserPhoto(),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SearchBar(
                    elevation: MaterialStatePropertyAll(.5),
                    hintText: 'Search',
                    autoFocus: true,
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
