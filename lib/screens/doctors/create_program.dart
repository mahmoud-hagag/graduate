import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/custom_card_program.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/text_field.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/screens/doctors/tab_bar.dart';

class CreateProgram extends StatefulWidget {
  const CreateProgram({super.key});

  @override
  State<CreateProgram> createState() => _CreateProgramState();
}

class _CreateProgramState extends State<CreateProgram> {
  late List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  TextEditingController gender = TextEditingController();
  TextEditingController disAbility = TextEditingController();
  TextEditingController monthes = TextEditingController();
  TextEditingController title = TextEditingController();
  bool isSelectedG = true;
  bool isSelectedD = true;
  bool isSelectedM = true;
  final int _counterReps = 0;
  final int _counterSets = 0;
  final int _counterW = 0;
  final int _counterRest = 0;

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
                  'Create Program',
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
                Row(
                  children: [
                    DropdownMenu(
                        width: 350,
                        inputDecorationTheme: const InputDecorationTheme(
                          fillColor: Colors.transparent,
                          filled: false,
                          enabledBorder: InputBorder.none,
                        ),
                        menuStyle: const MenuStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 120, 66, 3)),
                          elevation: MaterialStatePropertyAll(6),
                        ),
                        hintText: "Gender",
                        controller: gender,
                        errorText: !isSelectedG ? 'choose!!' : null,
                        onSelected: (value) {
                          setState(() {
                            isSelectedG = true;
                            gender.text = value.toString();
                          });
                        },
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownMenuEntries: dropdownMenuEntries = [
                          const DropdownMenuEntry(value: 'male', label: "Male"),
                          const DropdownMenuEntry(
                              value: 'female', label: "Female"),
                        ]),
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                        controller: disAbility,
                        errorText: !isSelectedD ? 'choose!!' : null,
                        hintText: "Disability",
                        onSelected: (value) {
                          setState(() {
                            isSelectedD = true;
                            disAbility.text = value.toString();
                          });
                        },
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownMenuEntries: dropdownMenuEntries = [
                          const DropdownMenuEntry(
                              value: 'upper', label: "Upper"),
                          const DropdownMenuEntry(
                              value: 'lower', label: "Lower"),
                          const DropdownMenuEntry(value: 'arm', label: "Arm"),
                          const DropdownMenuEntry(value: 'leg', label: "Leg"),
                        ]),
                  ],
                ),
                const SizedBox(
                  height: 15,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomCardProgram(
                      counter: _counterReps,
                      name: 'Reps',
                      unit: 'reps',
                    ),
                    CustomCardProgram(
                  counter: _counterSets,
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
                      counter: _counterRest,
                      name: 'Rest Time',
                      unit: 'S',
                    ),
                    CustomCardProgram(
                  counter: _counterW,
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
                    text: 'Create Program',
                    color1: color1Button,
                    color2: color2Button,
                    onTab: () {
                      // do function to submit program
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
