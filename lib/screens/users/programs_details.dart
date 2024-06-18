import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/program_card.dart';
import 'package:graduate/constants/colors.dart';

class ProgramsDetails extends StatefulWidget {
  const ProgramsDetails({super.key});

  @override
  State<ProgramsDetails> createState() => _ProgramsDetailsState();
}

class _ProgramsDetailsState extends State<ProgramsDetails> {
  late List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  TextEditingController week = TextEditingController();
  bool isSelectedG = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                'Programs Details',
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
              const ProgramCard(
                day: 'saterday',
                name: 'Push Up',
                repsvalue: 10,
                value: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              const ProgramCard(
                day: 'sunday',
                name: 'Push Up',
                repsvalue: 7,
                value: .7,
              ),
              const SizedBox(
                height: 10,
              ),
              const ProgramCard(
                day: 'monday',
                name: 'Deadlift',
                repsvalue: 3,
                value: .3,
              ),
              ],
          ),
        ),
      ),
    );
  }
}
