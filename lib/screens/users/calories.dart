import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/program_card.dart';
import 'package:graduate/constants/colors.dart';

class Calories extends StatefulWidget {
  const Calories({super.key});

  @override
  State<Calories> createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  late List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  TextEditingController week = TextEditingController();
  bool isSelectedG = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  'calories',
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
                 Column(
                  children: [
                    const SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              '3,600',
                              style: TextStyle(
                                fontSize: 34,
                              ),
                            ),
                          ),
                          CircularProgressIndicator(
                            strokeAlign: 5,
                            strokeCap: StrokeCap.round,
                            strokeWidth: 40,
                            backgroundColor: backGround,
                            valueColor: AlwaysStoppedAnimation<Color>(baseColor),
                            value: .75,
                          ),
                          Text(
                            'cal',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      '🔥Total Calories burned',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'These numbers are based on distance and weight',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        DropdownMenu(
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
                        hintText: "week",
                        controller: week,
                        errorText: !isSelectedG ? 'choose!!' : null,
                        onSelected: (value) {
                          setState(() {
                            isSelectedG = true;
                            week.text = value.toString();
                          });
                        },
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownMenuEntries: dropdownMenuEntries = [
                          const DropdownMenuEntry(
                              value: 'this week', label: "this week"),
                          const DropdownMenuEntry(
                              value: 'next week', label: "next week"),
                          const DropdownMenuEntry(
                              value: 'previos week', label: "previos week"),
                        ]),
                      ],
                    ),
                
                    const ProgramCard(
                      day: 'monday',
                      name: 'Deadlift',
                      repsvalue: 3,
                      value: .3,
                    ),
                
                    const ProgramCard(
                      day: 'monday',
                      name: 'Deadlift',
                      repsvalue: 3,
                      value: .3,
                    ),
                
                    const ProgramCard(
                      day: 'monday',
                      name: 'Deadlift',
                      repsvalue: 3,
                      value: .3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
