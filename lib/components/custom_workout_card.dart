import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/models/workout_model.dart';
import 'package:graduate/screens/doctors/programs/edit_program.dart';
import 'package:graduate/screens/doctors/tab_bar.dart';
import 'package:graduate/services/cache_helper.dart';

// ignore: must_be_immutable
class CustomWorkoutCard extends StatefulWidget {
  CustomWorkoutCard({
    super.key,
    required this.workout,
  });

  WorkoutModel workout;
  @override
  State<CustomWorkoutCard> createState() => _CustomWorkoutCardState();
}

class _CustomWorkoutCardState extends State<CustomWorkoutCard> {
  deleteProgram() async {
    try {
    uId = CacheHelper.getData(key: 'uId');
    var response = await Dio().post('http://10.0.2.2:8000/api/workout/destroy',
        data: {
          'id': widget.workout.id,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $uId'},
        ));
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
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => NavBarDo(
                      currentIndex: 1,
                    ),
                  ),
                  (route) => false,
                );
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
    }catch(_){
      
    }
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
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditProgram(
                            name: widget.workout.name,
                            id: widget.workout.id,
                            counterReps: widget.workout.reps,
                            counterRest: widget.workout.rests,
                            counterSets: widget.workout.sets,
                            counterW: widget.workout.weight,
                            link: widget.workout.link,
                            goal: widget.workout.goal,
                          ),
                        ));
                      },
                      icon: const Icon(
                        Icons.mode_edit_rounded,
                        color: baseColor,
                        size: 35,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await deleteProgram();
                        },
                        icon: const Icon(
                          Icons.delete_outline_rounded,
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
