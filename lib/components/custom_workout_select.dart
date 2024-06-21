import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/workout_model.dart';

// ignore: must_be_immutable
class CustomWorkoutSelect extends StatefulWidget {
  CustomWorkoutSelect({
    super.key,
    required this.workout,
    required this.userId,
  });

  WorkoutModel workout;
  int userId;
  @override
  State<CustomWorkoutSelect> createState() => _CustomWorkoutSelectState();
}

class _CustomWorkoutSelectState extends State<CustomWorkoutSelect> {
  attachworkout() async {
    try {
      var response =
          await Dio().post('http://10.0.2.2:8000/api/users/attach', data: {
        'workout_id': widget.workout.id,
        'user_id': widget.userId,
      });
      if (response.data["status"]) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Success 👀',
            desc: response.data["msg"],
            btnOk: Center(
              child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(baseColor)),
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // ignore: use_build_context_synchronously
                  
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
              ),
            )).show();
      } else if (!response.data["status"]) {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Invalid Info ☠️',
          desc: response.data["msg"],
        ).show();
      }
    } catch (_) {}
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: .7,
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.workout.name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await attachworkout();
                        },
                        icon: const Icon(
                          Icons.check_circle_outline_rounded,
                          color: baseColor,
                          size: 35,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'duration:    reps:    sets:    exercise:',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  '${widget.workout.weight}            ${widget.workout.reps}         ${widget.workout.sets}          ${widget.workout.id}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
