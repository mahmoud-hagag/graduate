import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/text_field.dart';
import 'package:graduate/components/user_photo.dart';
import 'package:graduate/constants/colors.dart';

class CreateProgram extends StatefulWidget {
  const CreateProgram({super.key});

  @override
  State<CreateProgram> createState() => _CreateProgramState();
}

class _CreateProgramState extends State<CreateProgram> {
  late List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  TextEditingController gender = TextEditingController();
  TextEditingController disAbility = TextEditingController();
  bool isSelectedG = true;
  bool isSelectedD = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 1.5,
                    child: SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'fares',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                UserPhoto(
                                  isDoctor: false,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomTextField(
                    label: 'ID for user',
                    controller: TextEditingController(),
                    icon: Icons.abc,
                    validator: (p0) {
                      return p0!.isNotEmpty ? null : "Field can't be empty";
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: DropdownMenu(
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
                            const DropdownMenuEntry(
                                value: 'male', label: "Male"),
                            const DropdownMenuEntry(
                                value: 'female', label: "Female"),
                          ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: DropdownMenu(
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 230,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Create Program',
                    color1: color1Button,
                    color2: color2Button,
                    onTab: () {},
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
