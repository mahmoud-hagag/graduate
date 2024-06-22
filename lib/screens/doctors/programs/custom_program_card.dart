import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/constants/variables.dart';
import 'package:graduate/models/programs_model.dart';
import 'package:graduate/screens/doctors/tab_bar.dart';
import 'package:graduate/services/cache_helper.dart';

// ignore: must_be_immutable
class CustomProgramCard extends StatefulWidget {
  CustomProgramCard({
    super.key,
    required this.program,
  });

  ProgramModel program;
  @override
  State<CustomProgramCard> createState() => _CustomProgramCardState();
}

class _CustomProgramCardState extends State<CustomProgramCard> {
  deleteProgram() async {
    try {
    uId = CacheHelper.getData(key: 'uId');
    var response = await Dio().post('http://10.0.2.2:8000/api/program/destroy',
        data: {
          'id': widget.program.id,
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
            ],
          ),
        ),
      ),
    );
  }
}
