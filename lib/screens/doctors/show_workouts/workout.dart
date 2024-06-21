import 'package:flutter/material.dart';
import 'package:graduate/components/custom_workout_card.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/models/workout_model.dart';
import 'package:graduate/screens/doctors/show_workouts/get_all_workouts.dart';
import 'package:graduate/screens/doctors/tab_bar.dart';

class WorkOut extends StatefulWidget {
  const WorkOut({super.key});

  @override
  State<WorkOut> createState() => _WorkOutState();
}

class _WorkOutState extends State<WorkOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20, right: 8),
            child: Column(
              children: [
                Header(
                  'Workout',
                  rightSide: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => NavBarDo(
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
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: FutureBuilder<List<WorkoutModel>>(
                    future: GetAllWorkout().getAllWorkout(),
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
                        List<WorkoutModel> workout = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: workout.length,
                          itemBuilder: (context, index) {
                            return CustomWorkoutCard(workout: workout[index]);
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
