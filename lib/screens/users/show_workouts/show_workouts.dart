import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/day_model.dart';
import 'package:graduate/models/workout_model.dart';
import 'package:graduate/screens/users/show_workouts/custom_workout_card.dart';
import 'package:graduate/screens/users/show_workouts/get_day_workouts.dart';

// ignore: must_be_immutable
class ShowWorkouts extends StatefulWidget {
  ShowWorkouts({super.key, required this.program});

  DayModel program;
  @override
  State<ShowWorkouts> createState() => _ShowWorkoutsState();
}

class _ShowWorkoutsState extends State<ShowWorkouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20, right: 8),
            child: Column(
              children: [
                Header(
                  'Workouts day',
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
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 20,),
                  child: FutureBuilder<List<WorkoutModel>>(
                    future: GetWorkoutDay().getWorkoutDay(widget.program.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 600),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        Future.delayed(const Duration(seconds: 2));
                        List<WorkoutModel> day = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: day.length,
                          itemBuilder: (context, index) {
                            return CustomWorkoutCardU(workout: day[index]);
                          },
                        );
                      } else {
                        return const Center(child: Text('No workout found'));
                      }
                    },
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
