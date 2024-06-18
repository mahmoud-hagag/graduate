import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/screens/doctors/tab_bar.dart';

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
            child: Column(
              children: [
                Header(
                  'Search',
                  rightSide: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => 
                          NavBarDo(
                            currentIndex: 4,
                          ),
                          ),
                          (route) => false,
                          );
                    },
                    child: UserPhoto(
                      isDoctor: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SearchBar(
                    onSubmitted: (value) {},
                    elevation: const MaterialStatePropertyAll(.5),
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
