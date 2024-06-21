import 'package:flutter/material.dart';
import 'package:graduate/components/custom_workout_select.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/workout_model.dart';
import 'package:graduate/screens/doctors/show_workouts/get_all_workouts.dart';

// ignore: must_be_immutable
class AttachWorkout extends StatelessWidget {
  AttachWorkout({super.key,required this.id});

  int id;
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
                  'choose workout',
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
                            return CustomWorkoutSelect(workout: workout[index],userId: id,);
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
