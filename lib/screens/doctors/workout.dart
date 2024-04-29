import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/user_photo.dart';

class WorkOut extends StatelessWidget {
  const WorkOut({super.key});

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
                  'Workout',
                  rightSide: UserPhoto(
                    isDoctor: true,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 1.5,
                    child: SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.watch_outlined)),
                              const Text(
                                'Pushups',
                                style: TextStyle(
                                    fontSize: 26, fontStyle: FontStyle.italic),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.star_outline_rounded))
                            ],
                          ),
                          
                        ],
                      ),
                    ),
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
