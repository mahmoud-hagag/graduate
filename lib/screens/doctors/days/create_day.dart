import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/day_model.dart';
import 'package:graduate/models/programs_model.dart';
import 'package:graduate/screens/doctors/show_workouts/attach_workout.dart';
import 'package:graduate/screens/doctors/tab_bar.dart';

// ignore: must_be_immutable
class CreateDay extends StatefulWidget {
  CreateDay({super.key, required this.program});

  ProgramModel program;
  @override
  State<CreateDay> createState() => _CreateDayState();
}

class _CreateDayState extends State<CreateDay> {
  bool isLoading = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late DayModel day;
  createDay(String dayName) async {
    isLoading = true;
    setState(() {});
    try {
      var response = await Dio().post(
        'http://10.0.2.2:8000/api/day/create',
        data: {
          'name': dayName,
        },
      );
      if (response.data["status"]) {
        day = DayModel.fromJson(response.data["day"]);
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => AttachWorkout(
                      day: day,
                    ),
                  ));
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
    try {
      var response = await Dio().post(
        'http://10.0.2.2:8000/api/programs/attach',
        data: {
          'program_id': widget.program.id,
          'day_id': day.id,
        },
      );
      if (response.data["status"]) {
      } else if (!response.data["status"]) {}
    } catch (_) {}
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(
                          'Create Days',
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
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Day 1',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              child: CustomButton(
                                text: 'Create +',
                                color1: color1Button,
                                color2: color2Button,
                                onTab: () async {
                                  await createDay('day 1');
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Day 2',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              child: CustomButton(
                                text: 'Create +',
                                color1: color1Button,
                                color2: color2Button,
                                onTab: () async {
                                  await createDay('day 2');
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Day 3',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              child: CustomButton(
                                text: 'Create +',
                                color1: color1Button,
                                color2: color2Button,
                                onTab: () async {
                                  await createDay('day 3');
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Day 4',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              child: CustomButton(
                                text: 'Create +',
                                color1: color1Button,
                                color2: color2Button,
                                onTab: () async {
                                  await createDay('day 4');
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Day 5',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              child: CustomButton(
                                text: 'Create +',
                                color1: color1Button,
                                color2: color2Button,
                                onTab: () async {
                                  await createDay('day 5');
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: 'Submit',
                            color1: color1Button,
                            color2: color2Button,
                            onTab: () {
                              AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.success,
                                  animType: AnimType.rightSlide,
                                  title: 'Success 👀',
                                  desc: 'program created',
                                  btnOk: Center(
                                    child: TextButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  baseColor)),
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
                            },
                          ),
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
