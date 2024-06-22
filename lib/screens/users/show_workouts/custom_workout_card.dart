import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/workout_model.dart';
import 'package:graduate/screens/users/play_video.dart';

// ignore: must_be_immutable
class CustomWorkoutCardU extends StatelessWidget {
  CustomWorkoutCardU({super.key, required this.workout});

  WorkoutModel workout;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Card(
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
                            builder: (context) => VideoPlayerScreen(workout: workout),
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
               Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'duration:   ',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      workout.weight.toString(),
                      style: const TextStyle(fontSize: 18, color:baseColor),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '            reps:   ',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      workout.reps.toString(),
                      style: const TextStyle(fontSize: 18, color:baseColor),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'sets:          ',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      workout.sets.toString(),
                      style: const TextStyle(fontSize: 18, color:baseColor),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '            rests:  ',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      workout.rests.toString(),
                      style: const TextStyle(fontSize: 18, color:baseColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
