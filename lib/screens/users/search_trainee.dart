import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/user_photo.dart';

class SearchTr extends StatelessWidget {
  const SearchTr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20.0),
            child:  Column(
              children: [
                Header(
                  'Search',
                  rightSide: UserPhoto(isDoctor: true,),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Padding(
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
