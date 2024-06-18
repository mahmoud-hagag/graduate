import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/screens/users/programs_details.dart';
import 'package:graduate/screens/users/progress.dart';

class Programs extends StatelessWidget {
  const Programs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Header(
                'Programs',
                rightSide: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    size: 35,
                    Icons.arrow_forward_ios_outlined,
                    color: baseColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProgramsDetails(),
                  ));
                },
                child: const Card(
                  elevation: .7,
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Icon(
                            Icons.directions_run_sharp,
                            size: 45,
                            color: baseColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Programs',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Progress(),
                  ));
                },
                child: const Card(
                  elevation: .7,
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Icon(
                            Icons.trending_up_rounded,
                            size: 45,
                            color: baseColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Progress',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Card(
                elevation: .7,
                child: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Icon(
                          Icons.food_bank_outlined,
                          size: 45,
                          color: baseColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          'Calories',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
