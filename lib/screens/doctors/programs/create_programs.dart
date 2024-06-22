import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/custom_button.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/components/text_field.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/programs_model.dart';
import 'package:graduate/screens/doctors/days/create_day.dart';

class CreatePrograms extends StatefulWidget {
  const CreatePrograms({super.key});

  @override
  State<CreatePrograms> createState() => _CreateProgramsState();
}

class _CreateProgramsState extends State<CreatePrograms> {
  TextEditingController title = TextEditingController();
  late ProgramModel program;
  bool isLoading = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  creatPrograms() async {
    isLoading = true;
    setState(() {});
    if (!(title.text == '')) {
      try {
        var response = await Dio().post(
          'http://10.0.2.2:8000/api/program/create',
          data: {
            'name': title.text,
          },
        );
        if (response.data["status"]) {
          program = ProgramModel.fromJson(response.data["program"]);
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
                      builder: (context) => CreateDay(
                        program: program,
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
    } else {
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        autoHide: const Duration(seconds: 4),
        title: 'Oops! ☠️☠️',
        desc: 'Please make sure all fields are filled out correctly.',
      ).show();
    }

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
                          height: 200,
                        ),
                        const Text(
                          'Program Name',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          label: 'Enter a title for the program',
                          controller: title,
                          icon: null,
                          validator: (p0) {
                            if (p0 == "") {
                              return "can't to be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: 'Create Program',
                            color1: color1Button,
                            color2: color2Button,
                            onTab: () async {
                              await creatPrograms();
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
