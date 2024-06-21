import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/workout_model.dart';
import 'package:graduate/screens/users/play_video.dart';

// ignore: must_be_immutable
class CustomWorkoutCardU extends StatelessWidget {
  CustomWorkoutCardU({super.key,required this.workout});

  WorkoutModel workout;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .7,
      child: SizedBox(
        width: double.infinity,
        height: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    workout.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const VideoPlayerScreen(),
                        ));
                      },
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        color: baseColor,
                        size: 35,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'duration:    reps:    sets:    exercise:',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '${workout.weight}            ${workout.reps}         ${workout.sets}          ${workout.id}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
