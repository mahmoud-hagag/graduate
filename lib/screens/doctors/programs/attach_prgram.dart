import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/programs_model.dart';
import 'package:graduate/models/user_model.dart';
import 'package:graduate/screens/doctors/programs/custom_program_select.dart';
import 'package:graduate/screens/doctors/programs/get_all_programs.dart';

// ignore: must_be_immutable
class AttachProgram extends StatefulWidget {
  AttachProgram({super.key,required this.user});
  UserModel user;
  @override
  State<AttachProgram> createState() => _AttachProgramState();
}

class _AttachProgramState extends State<AttachProgram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20, right: 8),
            child: Column(
              children: [
                Header(
                  'choose program',
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
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: FutureBuilder<List<ProgramModel>>(
                    future: GetAllPrograms().getAllPrograms(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 600),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        Future.delayed(const Duration(seconds: 2));
                        List<ProgramModel> program = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: program.length,
                          itemBuilder: (context, index) {
                            return CustomProgramSelect(
                              program: program[index],
                              user: widget.user,
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text('No workout found'));
                      }
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
