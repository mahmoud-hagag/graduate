import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/models/programs_model.dart';
import 'package:graduate/models/user_model.dart';
import 'package:graduate/services/cache_helper.dart';

// ignore: must_be_immutable
class CustomProgramSelect extends StatefulWidget {
  CustomProgramSelect({
    super.key,
    required this.program,
    required this.user,
  });

  ProgramModel program;
  UserModel user;
  @override
  State<CustomProgramSelect> createState() => _CustomProgramSelectState();
}

class _CustomProgramSelectState extends State<CustomProgramSelect> {
  attachProgram() async {
    uId = CacheHelper.getData(key: 'uId');
    try {
      var response =
          await Dio().post('http://10.0.2.2:8000/api/userPrograms/attach',
              options: Options(
                headers: {'Authorization': 'Bearer $uId'},
              ),
              data: {
            'program_id': widget.program.id,
            'user_id': widget.user.id,
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
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.program.name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await attachProgram();
                        },
                        icon: const Icon(
                          Icons.check_circle_outline_rounded,
                          color: baseColor,
                          size: 35,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
