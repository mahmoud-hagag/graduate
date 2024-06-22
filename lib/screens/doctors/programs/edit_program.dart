import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/custom_card_program.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/text_field.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/screens/doctors/show_workouts/create_workout.dart';
import 'package:graduate/screens/doctors/tab_bar.dart';
import 'package:graduate/services/cache_helper.dart';

// ignore: must_be_immutable
class EditProgram extends StatefulWidget {
  EditProgram({
    super.key,
    required this.name,
    required this.counterReps,
    required this.counterRest,
    required this.counterSets,
    required this.counterW,
    required this.id,
    required this.link,
    required this.goal,
  });

  String name;
  String link;
  String goal;
  int counterReps;
  int counterSets;
  int counterW;
  int counterRest;
  int id;

  @override
  State<EditProgram> createState() => _EditProgramState();
}

class _EditProgramState extends State<EditProgram> {
  late List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  TextEditingController monthes = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController link = TextEditingController();
  bool isSelectedM = false;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    title.text = widget.name;
    link.text = widget.link;
    monthes.text = widget.goal;
    counterReps = widget.counterReps;
    counterSets = widget.counterSets;
    counterW = widget.counterW;
    counterRest = widget.counterRest;
  }

  editprogram() async {
    isLoading = true;
    setState(() {});
    CacheHelper.getData(key: 'uId');
    var response = await Dio().post(
      'http://10.0.2.2:8000/api/workout/update',
      data: {
        'name': widget.name,
        'description': 'description',
        'goal': monthes.text,
        'reps': counterReps,
        'sets': counterSets,
        'weight': counterW,
        'rest': counterRest,
        'link': link.text,
        'completed_sets': 0,
        'id': widget.id,
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
    isLoading = false;
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
                  'Update Program',
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
                  canEdit: false,
                  label: widget.name,
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
                CustomTextField(
                  label: widget.link,
                  controller: link,
                  icon: null,
                  validator: null,
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
                        hintText: "monthes",
                        onSelected: (value) {
                          setState(() {
                            isSelectedM = true;
                            monthes.text = value.toString();
                          });
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
                      countUnit: 5,
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
                    text: 'update Program',
                    color1: color1Button,
                    color2: color2Button,
                    onTab: () async {
                      editprogram();
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
