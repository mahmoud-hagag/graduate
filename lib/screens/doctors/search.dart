import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: const Column(
              children: [
                Header('Dear 7oda', rightSide: Text('searh'))
              ],
            ),
          ),
        ),
      ),
    );
 }
}