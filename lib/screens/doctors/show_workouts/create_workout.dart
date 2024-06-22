import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/custom_card_program.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/text_field.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/screens/doctors/tab_bar.dart';
import 'package:graduate/services/cache_helper.dart';

class CreateWorkout extends StatefulWidget {
  const CreateWorkout({super.key});

  @override
  State<CreateWorkout> createState() => _CreateWorkoutState();
}

class _CreateWorkoutState extends State<CreateWorkout> {
  late List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  TextEditingController gender = TextEditingController();
  TextEditingController disAbility = TextEditingController();
  TextEditingController monthes = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController link = TextEditingController();
  bool isSelectedG = true;
  bool isSelectedD = true;
  bool isSelectedM = true;
  @override
  void initState() {
    super.initState();
    counterReps = 0;
    counterSets = 0;
    counterRest = 0;
    counterW = 0;
  }

  creatprogram() async {
    try {
    uId = CacheHelper.getData(key: 'uId');
    var response = await Dio().post(
      'http://10.0.2.2:8000/api/workout/create',
      data: {
        'name': title.text,
        'description': 'description',
        'goal': monthes.text,
        'reps': counterReps,
        'sets': counterSets,
        'weight': counterW,
        'rest': counterRest,
        'link': link.text,
        'completed_sets': 0,
      },
      options: Options(
        headers: {'Authorization': 'Bearer $uId'},
      ),
    );
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
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  'Create workout',
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
                  height: 10,
                ),
                const Text(
                  'Regular exercise',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  label: 'Enter a title for the exercise',
                  controller: title,
                  icon: null,
                  validator: null,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Link Video',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    DropdownMenu(
                        inputDecorationTheme: const InputDecorationTheme(
                          fillColor: Colors.transparent,
                          filled: false,
                          enabledBorder: InputBorder.none,
                        ),
                        width: 350,
                        menuStyle: const MenuStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 120, 66, 3)),
                          elevation: MaterialStatePropertyAll(6),
                        ),
                        controller: link,
                        errorText: !isSelectedM ? 'choose!!' : null,
                        hintText: "Linkes",
                        onSelected: (value) {
                          isSelectedM = true;
                          link.text = value.toString();
                        },
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownMenuEntries: dropdownMenuEntries = [
                          const DropdownMenuEntry(
                              value: 'butterfly', label: "butterfly"),
                          const DropdownMenuEntry(
                              value: 'shoulder_1', label: "shoulder 1"),
                          const DropdownMenuEntry(
                              value: 'shoulder_2', label: "shoulder 2"),
                          const DropdownMenuEntry(
                              value: 'leg_1', label: "leg 1"),
                          const DropdownMenuEntry(
                              value: 'leg_2', label: "leg 2"),
                          const DropdownMenuEntry(
                              value: 'leg_3', label: "leg 3"),
                          const DropdownMenuEntry(
                              value: 'leg_4', label: "leg 4"),
                          const DropdownMenuEntry(
                              value: 'upper_1', label: "upper 1"),
                          const DropdownMenuEntry(
                              value: 'side_blank_1', label: "side blank"),
                          const DropdownMenuEntry(
                              value: 'push_ups_1', label: "push up 1"),
                          const DropdownMenuEntry(
                              value: 'push_ups_2', label: "push up 2"),
                          const DropdownMenuEntry(
                              value: 'adv_abs_2', label: "decline"),
                          const DropdownMenuEntry(
                              value: 'abs_3', label: "cranch"),
                          const DropdownMenuEntry(
                              value: 'chest_2', label: "chest press"),
                          const DropdownMenuEntry(
                              value: 'chest_1', label: "floor press"),
                        ]),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'set goal 📅',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    DropdownMenu(
                        inputDecorationTheme: const InputDecorationTheme(
                          fillColor: Colors.transparent,
                          filled: false,
                          enabledBorder: InputBorder.none,
                        ),
                        width: 350,
                        menuStyle: const MenuStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 120, 66, 3)),
                          elevation: MaterialStatePropertyAll(6),
                        ),
                        controller: monthes,
                        errorText: !isSelectedM ? 'choose!!' : null,
                        hintText: "monthes",
                        onSelected: (value) {
                          isSelectedM = true;
                          monthes.text = value.toString();
                        },
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownMenuEntries: dropdownMenuEntries = [
                          const DropdownMenuEntry(
                              value: '1 month', label: "1 month"),
                          const DropdownMenuEntry(
                              value: '2 monthes', label: "2 monthes"),
                        ]),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomCardProgram(
                      counter: counterReps,
                      name: 'Reps',
                      unit: 'reps',
                    ),
                    CustomCardProgram(
                      counter: counterSets,
                      name: 'Sets',
                      unit: 'sets',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomCardProgram(
                      countUnit: 5,
                      counter: counterRest,
                      name: 'Rest Time',
                      unit: 'S',
                    ),
                    CustomCardProgram(
                      counter: counterW,
                      name: 'Weight',
                      unit: 'lbs',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Create Workout',
                    color1: color1Button,
                    color2: color2Button,
                    onTab: () async {
                      creatprogram();
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

int counterReps = 0;
int counterSets = 0;
int counterW = 0;
int counterRest = 0;
