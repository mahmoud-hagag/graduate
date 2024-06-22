import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/screens/doctors/programs/create_programs.dart';
import 'package:graduate/screens/doctors/show_workouts/create_workout.dart';

class CreateAttach extends StatelessWidget {
  const CreateAttach({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(
                    'Create plan',
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
                    height: 200,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Create Program',
                      color1: color1Button,
                      color2: color2Button,
                      onTab: () {
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreatePrograms(),
                    ));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Create Workout',
                      color1: color1Button,
                      color2: color2Button,
                      onTab: () {
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreateWorkout(),
                    ));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
